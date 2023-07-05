#!/usr/bin/env python3

import itertools
import json
from math import ceil, log
from pathlib import Path


def load_config(file_path):
    with Path(file_path).open("r") as file:
        return json.load(file)


def collect_instr(qc):
    instr = []
    num_qubits = len(qc.qubits)

    reg_mapper = {}

    last = 0

    for reg in qc.qregs:
        reg_mapper[reg.name] = last
        last = last + reg.size

    instr = []
    for _i, gate in enumerate(qc.data):
        gate_data = {}
        gate_data["qubits"] = []
        gate_data["clbits"] = []

        for field in gate:
            if "library" in str(field) or "circuit" in str(field) or "Instruction" in str(field):
                gate_data["name"] = type(field).__name__

            if "QuantumRegister" in str(field):
                gate_data["qubits"] += [(reg_mapper[f.register.name] + f.index) for f in field]

            if "ClassicalRegister" in str(field):
                gate_data["clbits"] += [f.index for f in field]

        instr.append(gate_data)

    return instr, num_qubits


def fix(edge):
    # need for swap and ordered access of edges to have undirected graph abstraction
    base, up = edge[0], edge[1]
    if base > up:
        return up, base

    return edge


def add_present(g, edge):
    if not (g.has_edge(*edge)):
        g.add_edge(*edge, weight=0)
        return False

    return True


def update_edge(g, amount, edges):
    for i, e in enumerate(edges):
        edges[i] = fix(e)  # Update e directly with the fixed value

        add_present(g, edges[i])
        g[edges[i][0]][edges[i][1]]["weight"] = g[edges[i][0]][edges[i][1]]["weight"] + amount


def cluster_table_size(cluster):
    n = ceil(log(len(cluster)) / log(2))
    return list(itertools.product([0, 1], repeat=n))


def logic_size_full(cluster):
    counter = 1

    for _i in range(len(cluster) - 1):
        counter *= 2

    return counter


def logic_size_lev(cluster):
    return 1
    counter = 0
    table = cluster_table_size(cluster)

    for entry in table:
        if entry[-1] == 1:
            counter += 1

    return counter


def update_edge_new_weight(g, amount, edges):
    for i, e in enumerate(edges):
        edges[i] = fix(e)  # Update e directly with the fixed value

        add_present(g, edges[i])
        g[edges[i][0]][edges[i][1]]["qudit_weight"] = g[edges[i][0]][edges[i][1]]["qudit_weight"] + amount
