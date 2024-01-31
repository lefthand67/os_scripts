import subprocess
from pathlib import Path

def activate_virtualenv(venv_path):

    # Check if the provided path exists
    venv_path = Path(venv_path)
    if not venv_path.exists():
        print(f"Error: Virtual environment '{venv_path}' not found.")
        return

    # Construct the activation command based on the operating system
    activate_cmd = "source" if venv_path.parts[-1] == 'posix' else "activate"

    # Execute the activation command
    activate_script = venv_path / "bin" / activate_cmd
    activation_command = f"source {activate_script}"

    subprocess.run(activation_command, shell=True)


# keep in mind that running this function in your Python script won't
# activate the virtual environment for the entire terminal session.
# Activation is specific to the current process. If you want to activate
# the virtual environment for your entire terminal session, you should run
# the script with the source command in your terminal
