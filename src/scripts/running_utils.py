#!/usr/bin/env python3

import os
from pathlib import Path

import networkx as nx
from parsing_utils import load_config

paths = load_config("config.json")


def run_clustering_con(g, inputf, outputf, k, costf):
    data = Path(inputf).open("w+")

    for node in g.nodes:
        line = ""
        line = line + str(node) + " "
        line += str(len(list(g.neighbors(node))))

        for n2 in list(g.neighbors(node)):
            line = line + " " + str(n2)

        for n2 in list(g.neighbors(node)):
            line = line + " " + str(g[node][n2]["weight"])

        line += "\n"
        data.write(line)

    data.close()

    print("EXECUTE")
    r = 20000
    command = (
        "cd "
        + paths["gclu"]
        + " && ./gclu "
        + inputf
        + " -o "
        + outputf
        + " --seed 1632488925 -R "
        + str(r)
        + " -K "
        + str(k)
        + " --algo m --costf "
        + str(costf)
        + " --type similarity --scale=no "
    )
    os.system(command)
    print("FIN EXEC")

    nodes_by_color = {}
    color_by_node = {}

    error_level_by_color = {}
    each_color_weight = {}
    saved_entanglement_by_color = {}
    saved_weight_by_color = {}

    for i in range(1, k + 1):
        nodes_by_color[i] = []
        error_level_by_color[i] = 0
        each_color_weight[i] = 0
        saved_entanglement_by_color[i] = 0
        saved_weight_by_color[i] = 0

    data = Path(outputf).open()
    lines = False
    counter = 0
    for line in data:
        if "---" in line:
            lines = True
        elif lines:
            k = [int(s) for s in line.split() if s.isdigit()][0]

            nodes_by_color[k].append(counter)
            color_by_node[counter] = k
            counter += 1

        # print(line)

    # Close the file
    data.close()

    nx.set_node_attributes(g, color_by_node, "c")

    for n in range(len(list(g.nodes))):
        if len(list(g.neighbors(n))) == 1:
            g.nodes[n]["c"] = g.nodes[list(g.neighbors(n))[0]]["c"]

    new_col_by_node = []
    for i in g.nodes(data=True):
        new_col_by_node.append(i[1]["c"])

    return (
        nodes_by_color,
        color_by_node,
        error_level_by_color,
        each_color_weight,
        saved_entanglement_by_color,
        saved_weight_by_color,
        new_col_by_node,
    )


def run_clustering_all(g, inputf, outputf, k, costf):
    data = Path(inputf).open("w+")
    for node in g.nodes:
        line = ""
        line = line + str(node) + " "
        line += str(len(list(g.nodes)))

        for n2 in g.nodes:
            line = line + " " + str(n2)

        for n2 in g.nodes:
            if n2 in list(g.neighbors(node)):
                line = line + " " + str(g[node][n2]["weight"])
            else:
                line += " 0.1"
        line += "\n"

        data.write(line)

    # Close the file
    data.close()

    print("EXECUTE")
    r = 20000
    command = (
        "cd "
        + paths["gclu"]
        + " && ./gclu "
        + inputf
        + " -o "
        + outputf
        + " --seed 1632488925 -R "
        + str(r)
        + " -K "
        + str(k)
        + " --algo m --costf "
        + str(costf)
        + " --type similarity --scale=no "
    )
    os.system(command)
    print("FIN EXEC")

    nodes_by_color = {}
    color_by_node = {}

    error_level_by_color = {}
    each_color_weight = {}
    saved_entanglement_by_color = {}
    saved_weight_by_color = {}

    for i in range(1, k + 1):
        nodes_by_color[i] = []
        error_level_by_color[i] = 0
        each_color_weight[i] = 0
        saved_entanglement_by_color[i] = 0
        saved_weight_by_color[i] = 0

    data = Path(outputf).open()
    lines = False
    counter = 0
    for line in data:
        if "---" in line:
            lines = True
        elif lines:
            k = [int(s) for s in line.split() if s.isdigit()][0]

            nodes_by_color[k].append(counter)
            color_by_node[counter] = k
            counter += 1

    # Close the file
    data.close()

    nx.set_node_attributes(g, color_by_node, "c")

    # We don't need to fix terminal edges anymore, but we know it's a split qubit in that case, better not messing up
    for n in range(len(list(g.nodes))):
        if len(list(g.neighbors(n))) == 1:
            g.nodes[n]["c"] = g.nodes[list(g.neighbors(n))[0]]["c"]

    new_col_by_node = []
    for i in g.nodes(data=True):
        new_col_by_node.append(i[1]["c"])

    return (
        nodes_by_color,
        color_by_node,
        error_level_by_color,
        each_color_weight,
        saved_entanglement_by_color,
        saved_weight_by_color,
        new_col_by_node,
    )
