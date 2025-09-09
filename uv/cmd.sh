# install
# https://docs.astral.sh/uv/#highlights
curl -LsSf https://astral.sh/uv/install.sh | sh

# export installed env
# source $HOME/.local/bin/env (sh, bash, zsh)
# source $HOME/.local/bin/env.fish (fish)
source $HOME/.local/bin/env

# 1) create new env
$ uv venv my-env
$ uv venv my-env --python 3.11

# 2) use (activate) new env
$ uv venv my-env

# 4) list envs

# 5) Creating a Project with an Environment (uv init)
$ uv init my-project
$ cd my-project
