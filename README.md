[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/cda-tum/qmap/main/docs/source/_static/mqt_light.png" width="60%">
    <img src="https://raw.githubusercontent.com/cda-tum/qmap/main/docs/source/_static/mqt_dark.png" width="60%">
  </picture>
</p>

# MQT Qudit Compression - A Tool For Mapping Qubit Logic on Qudit Systems

A tool for mapping qubits on a qudit architecture of preferred size
the [Chair for Design Automation](https://www.cda.cit.tum.de/) at
the [Technical University of Munich](https://www.tum.de/).

If you have any questions, feel free to contact us via [quantum.cda@xcit.tum.de](mailto:quantum.cda@xcit.tum.de) or by
creating an [issue](https://github.com/cda-tum/mqt-qudit-compression/issues) on GitHub. For more information on Decision Diagrams,
please visit [www.cda.cit.tum.de/research/quantum_dd/](https://www.cda.cit.tum.de/research/quantum/).

### System Requirements

Building (and running) is continuously tested under Linux, MacOS using
the [latest available system versions for GitHub Actions](https://github.com/actions/virtual-environments).
The implementation is compatible with a minimimum version of Python 3.8.

Git is required for the installation process.

### Setup, Build, and Run

The tool demands only for the resolution of dependencies, to solve run in terminal.
Run the installation procedure through the script.

```
./installation.sh
```

In the first step, the installation script initiates with creation of the folders and subfolder for the storage of the solutions.

The second step consists in installing [GCLU](https://github.com/uef-machine-learning/gclu), the graph clustering algorithm used in the project.

Successively, the script creates a new python environment where the dependencies found in the "pyproject.toml" file are installed.

After the installation, import the qasm files required under the data folder, in a folder named "selected_data".
Otherwise, please modify the links in configuration file "config.json".

The file contains the links to the data and solutions required by the scripts to run correctly.
It is recommended to use absolute paths.

## Usage

Remember to activate the python environment of the project, with the following lines in the terminal:

```
source compEnv/bin/activate
```

Once the qasm files are chosen, enter the scripts folder

```
cd src/scripts/
```

and run one of the scripts, as:

```
python3 MQT_COMPRESS_lev_con.py
```

The final outputs will be in the relative csv files.

## References

K. Mato, S. Hillmich, R. Wille, "Compression of Qubit Circuits: Mapping to Mixed-Dimensional Quantum Systems", IEEE QSW 2023 : IEEE International Conference on Quantum Software
