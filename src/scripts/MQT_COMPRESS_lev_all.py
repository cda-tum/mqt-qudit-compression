#!/usr/bin/env python3

import os
import re
from csv import writer
from math import ceil
from pathlib import Path

import networkx as nx
import numpy as np
import pandas as pd
from parsing_utils import collect_instr, load_config, logic_size_lev, update_edge
from qiskit import QuantumCircuit
from running_utils import run_clustering_all

paths = load_config("config.json")

path = paths["selected_data"]
path_save = paths["all_levels_solutions"]
csv_path = paths["all_levels_solutions_csv"]

df = pd.DataFrame(
    [],
    columns=[
        "File",
        "Iteration",
        "Connected",
        "Size",
        "Clustersize",
        "Total_CZ",
        "Still_CZ",
        "Ratio",
        "Saved_entanglement_by_color",
    ],
)
df.to_csv(csv_path, index=False)

fileslist = []

directory = os.fsencode(path)
outcomes = []
for file in os.listdir(directory):
    filename = os.fsdecode(file)
    if filename.endswith(".qasm"):
        fileslist.append(str(filename))

fileslist.sort(key=lambda f: int(re.sub("\\D", "", f)))

for ix, _f in enumerate(fileslist):
    filename = _f
    qc = QuantumCircuit.from_qasm_file(path + "/" + filename)

    parsed_circ, numqubits = collect_instr(qc)

    # --------       LEVELS TRACKING

    # 2*2 = 4 the 4th is the level 1 of qubit 2, indexed as 1
    number_node = 2 * numqubits
    nodes = list(range(number_node))

    relabeling = []
    for i in range(numqubits):
        for j in range(2):
            relabeling.append((i, j))
    pseudo_dict = list(zip(nodes, relabeling))

    qubit_levels_dict = {}
    for entry in pseudo_dict:
        qubit_levels_dict[entry[1]] = entry[0]

    print(numqubits)
    print(qubit_levels_dict)

    node2qubit = {}
    for key in qubit_levels_dict:
        node2qubit[qubit_levels_dict[key]] = key[0]

    # ----------------------------------------------

    print("PARSED")

    G = nx.Graph()
    G.add_nodes_from(nodes)

    CZcount = 0

    EWEIGHT = 100
    LWEIGHT = 400
    Eerror = 100
    Lerror = 10

    ######################################
    total_error_level_local = 0
    total_error_level_entanglement = 0
    total_qubit_entanglement = 0
    total_qubit_local = 0
    ######################################

    for ins in parsed_circ:
        if ins["name"] == "Measure" or ins["name"] == "Barrier":
            continue
        elif ins["name"] == "CZGate":
            CZcount += 1

            control = ins["qubits"][0]
            control_level = qubit_levels_dict[(control, 1)]

            targets = ins["qubits"][1:]
            for qubit in targets:
                one = qubit_levels_dict[(qubit, 1)]

                update_edge(G, EWEIGHT, [(control_level, one)])

                total_error_level_entanglement += Eerror
                total_qubit_entanglement += EWEIGHT

        elif ins["name"] != "Measure":
            qubit_ref = ins["qubits"][0]
            e0 = qubit_levels_dict[(qubit_ref, 0)]
            e1 = qubit_levels_dict[(qubit_ref, 1)]

            update_edge(G, LWEIGHT, [(e0, e1)])

            total_error_level_local += Lerror
            total_qubit_local += LWEIGHT

    ######################################
    print(total_error_level_local)
    print(total_error_level_entanglement)
    print(total_qubit_entanglement)
    print(total_qubit_local)
    ######################################
    ######################################

    #           FOR LOOP IN RANGE CLUSTER REPEATED 4 TIMES

    ######################################
    filename = filename.replace(".qasm", "")

    for iteration in range(1):
        for QUDIT_SIZE in [2, 3, 4, 5]:
            connected = True

            k = ceil(len(nodes) / QUDIT_SIZE)
            if k < 2:
                outcomes = [str(filename), iteration, np.NaN, QUDIT_SIZE, np.NaN, np.NaN, np.NaN, np.NaN]

                with Path(csv_path).open("a") as f_object:
                    writer_object = writer(f_object)
                    writer_object.writerow(outcomes)

                    # Close the file object
                    f_object.close()
                continue

            inputf = (
                path_save + "/graphs/" + filename + "_unlab_lev_all" + str(iteration) + "_" + str(QUDIT_SIZE) + ".txt"
            )
            outputf = (
                path_save
                + "/graphs/"
                + filename
                + "_solution_lev_all"
                + str(iteration)
                + "_"
                + str(QUDIT_SIZE)
                + ".txt"
            )

            os.system("> " + inputf)
            os.system("> " + outputf)

            (
                nodes_by_color,
                color_by_node,
                error_level_by_color,
                each_color_weight,
                saved_entanglement_by_color,
                saved_weight_by_color,
                new_col_by_node,
            ) = run_clustering_all(G, inputf, outputf, k, 2)

            color_by_node = new_col_by_node

            valid = []
            for color in nodes_by_color.values():
                H = G.subgraph(color)

                if len(H.nodes) != 0:
                    valid.append(nx.is_connected(H))

            if False in valid:
                (
                    nodes_by_color,
                    color_by_node,
                    error_level_by_color,
                    each_color_weight,
                    saved_entanglement_by_color,
                    saved_weight_by_color,
                    new_col_by_node,
                ) = run_clustering_all(G, inputf, outputf, k, 1)
                color_by_node = new_col_by_node
                valid = []
                for color in nodes_by_color.values():
                    H = G.subgraph(color)

                    if len(H.nodes) != 0:
                        valid.append(nx.is_connected(H))
                if False in valid:
                    connected = False

            qudit_entangling_op = 0
            still_cz = 0

            ######################################
            total_qudit_error_level_local = 0
            total_qudit_error_level_entanglement = 0
            total_qudit_entanglement = 0
            total_qudit_local = 0
            ######################################

            for ins in parsed_circ:
                if ins["name"] == "Measure" or ins["name"] == "Barrier":
                    continue

                elif ins["name"] == "CZGate":
                    control = ins["qubits"][0]
                    control_level = qubit_levels_dict[(control, 1)]

                    targets = ins["qubits"][1:]
                    for qubit in targets:
                        one = qubit_levels_dict[(qubit, 1)]

                        clust_control = color_by_node[control_level]
                        cluster_one = color_by_node[one]

                        if clust_control != cluster_one:
                            # size calculation #
                            control_new_logic_size = logic_size_lev(nodes_by_color[clust_control])
                            target_new_logic_size = logic_size_lev(nodes_by_color[cluster_one])
                            new_edges = control_new_logic_size * target_new_logic_size

                            total_qudit_error_level_entanglement = (
                                total_qudit_error_level_entanglement + new_edges * Eerror
                            )
                            total_qudit_entanglement = total_qudit_entanglement + new_edges * EWEIGHT

                            ##############################
                            qudit_entangling_op += new_edges
                            still_cz += 1
                            ##############################

                        else:
                            total_qudit_error_level_local += Lerror
                            total_qudit_local += LWEIGHT

                            error_level_by_color[clust_control] += Lerror
                            each_color_weight[clust_control] += LWEIGHT

                            saved_entanglement_by_color[clust_control] = (
                                saved_entanglement_by_color[clust_control] + Eerror
                            )
                            saved_weight_by_color[clust_control] += EWEIGHT

                elif ins["name"] != "Measure":
                    qubit_ref = ins["qubits"][0]
                    e0 = qubit_levels_dict[(qubit_ref, 0)]
                    e1 = qubit_levels_dict[(qubit_ref, 1)]

                    cluster_zero = color_by_node[e0]
                    cluster_one = color_by_node[e1]

                    if cluster_zero != cluster_one:
                        # size calculation
                        control_new_logic_size = logic_size_lev(nodes_by_color[cluster_zero])
                        target_new_logic_size = logic_size_lev(nodes_by_color[cluster_zero])
                        new_edges = control_new_logic_size * target_new_logic_size

                        total_qudit_error_level_entanglement = (
                            total_qudit_error_level_entanglement + new_edges * 4 * Eerror
                        )
                        total_qudit_entanglement = total_qudit_entanglement + new_edges * 4 * EWEIGHT

                        ##############################
                        qudit_entangling_op += 4 * new_edges
                        still_cz += 4
                        ##############################

                    else:
                        total_qudit_error_level_local += Lerror
                        total_qudit_local += LWEIGHT

                        error_level_by_color[cluster_zero] += Lerror
                        each_color_weight[cluster_zero] += LWEIGHT

            ######################################
            print("local error:", total_error_level_local, total_qudit_error_level_local)
            print("entanglement error:", total_error_level_entanglement, total_qudit_error_level_entanglement)
            print("entanglement interaction", total_qubit_entanglement, total_qudit_entanglement)
            print("local interaction", total_qubit_local, total_qudit_local)
            ######################################
            print("---------------------------------")
            #################################
            print(error_level_by_color)
            print(each_color_weight)
            #################################
            print("Saved Entanglement error ", saved_entanglement_by_color)
            print("Saved Entanglement weight ", saved_weight_by_color)

            particles = []
            for group in nodes_by_color:
                hilbert_dimensions = {}
                for lev in nodes_by_color[group]:
                    if node2qubit[lev] in hilbert_dimensions:
                        hilbert_dimensions[node2qubit[lev]] += 1
                    else:
                        hilbert_dimensions[node2qubit[lev]] = 1

                answer = 1
                for i in hilbert_dimensions:
                    answer *= hilbert_dimensions[i]
                particles.append(answer)

            if CZcount == 0:
                outcomes = [
                    str(filename),
                    iteration,
                    connected,
                    particles,
                    QUDIT_SIZE,
                    CZcount,
                    still_cz,
                    np.NaN,
                    saved_entanglement_by_color,
                ]
            else:
                outcomes = [
                    str(filename),
                    iteration,
                    connected,
                    particles,
                    QUDIT_SIZE,
                    CZcount,
                    still_cz,
                    still_cz / CZcount,
                    saved_entanglement_by_color,
                ]

            with Path(csv_path).open("a") as f_object:
                writer_object = writer(f_object)
                writer_object.writerow(outcomes)

                # Close the file object
                f_object.close()
