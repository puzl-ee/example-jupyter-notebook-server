export PYTHONUSERBASE=/tmp

#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/mykey.key -out /tmp/mycert.pem

pip install --user -r requirements.txt

jupyter-notebook --notebook-dir="${__PUZL_WORKING_DIR}" --config=./jupyter_notebook_config.py