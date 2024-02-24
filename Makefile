define colorecho
	@tput setaf	2
	@echo $1
	@tput sgr0
endef

all: make_executable run_scripts

make_executable:
	$(call colorecho,"НАЗНАЧАЮ ПРАВА НА ВЫПОЛНЕНИЕ ДЛЯ СКРИПТОВ:")
	chmod +x create_config_symlinks.sh
	chmod +x update_pip_modules.sh
	chmod +x generate_toc.py

run_scripts: make_executable
	$(call colorecho,"ЗАПУСКАЮ СКРИПТЫ:")
	./create_config_symlinks.sh
