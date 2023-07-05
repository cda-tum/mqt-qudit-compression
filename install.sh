#!/bin/bash

data_dir="data"
selected_solutions_dir="selected_solutions"
paper_selected_solutions_dir="prev_selected_solutions"
lev_all_dir="lev_all"
lev_con_dir="lev_con"
subfolder_names=("graphs" "result_from_graph")

# Check if "selected_solutions" folder exists
if [ -d "$data_dir/$selected_solutions_dir" ]; then
    # Rename existing "selected_solutions" folder to "paper_selected_solutions"
    mv "$data_dir/$selected_solutions_dir" "$data_dir/$paper_selected_solutions_dir"
    echo "Renamed existing \"$selected_solutions_dir\" folder to \"$paper_selected_solutions_dir\"."
fi

# Create new "selected_solutions" folder with subfolders
mkdir -p "$data_dir/$selected_solutions_dir/$lev_all_dir"
mkdir -p "$data_dir/$selected_solutions_dir/$lev_con_dir"

# Create subfolders inside "lev_all" and "lev_con"
for subfolder in "${subfolder_names[@]}"; do
    mkdir -p "$data_dir/$selected_solutions_dir/$lev_all_dir/$subfolder"
    mkdir -p "$data_dir/$selected_solutions_dir/$lev_con_dir/$subfolder"
done

echo "Folder handling completed."

cd ./src
# Clone the repository
git clone https://github.com/uef-machine-learning/gclu.git
cd ./gclu/

make

cd ../..



# Create Python virtual environment, python3 compatible

python3 -m venv compEnv

# Activate the virtual environment
source compEnv/bin/activate

cd ..

pip install .


# Finish
echo "Repository downloaded and installed."
