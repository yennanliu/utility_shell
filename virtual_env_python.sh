# Step 1)  Create a Python Virtual Environment

python3 -m venv ml_env

# Step 2) activate

# macOS/Linux
source ml_env/bin/activate

# install pkg
pip install mlflow scikit-learn pandas matplotlib


pip install notebook ipykernel
python -m ipykernel install --user --name ml-env --display-name "Python (ML Env)"