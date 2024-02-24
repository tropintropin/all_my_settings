all: make_executable run_scripts

make_executable:
	chmod +x create_config_symlinks.sh
	chmod +x update_pip_modules.sh
	chmod +x generate_toc.py

run_scripts: make_executable
	./create_config_symlinks.sh
