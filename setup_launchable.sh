#/bin/bash

curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
uv --version
# uv venv
cd /notebooks
uv pip install --system -r requirements.txt
mamba install -c conda-forge -c rapidsai cupy==14.0.1 numpy==2.2.6 -y

# Install with all dependencies using uv for CUDA 13
# export PATH="$HOME/.local/bin:$PATH"
# uv sync --extra cuda13

# Install Jupyter and JupyterLab
#mamba create --name test -c conda-forge cupy=14.0.1 numpy=2.2.6 -y
#conda activate test
# Create a Jupyter kernel for this environment
#uv run python -m ipykernel install --prefix /opt/conda/ --name=out-of-core --display-name "Out of Core Notebook"
#conda deactivate
set -m
# Start the primary process and put it in the background
export CONDA_PREFIX=/opt/conda
jupyter-lab --notebook-dir=/notebooks --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.allow_origin='*' --allow-root