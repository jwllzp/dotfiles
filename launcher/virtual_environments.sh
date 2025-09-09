if [ -d .venv ]; then
	VENV_DIR=".venv"
elif [ -d venv ]; then
	VENV_DIR="venv"
else
	VENV_DIR=
fi

if [ -n "$VENV_DIR" ]; then
	source ${VENV_DIR}/bin/activate
fi
