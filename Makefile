OS := $(shell uname)

define colorecho
	@tput setaf	2
	@echo $1
	@tput sgr0
endef

all: make_executable run_scripts install_pyenv

make_executable:
	$(call colorecho,"НАЗНАЧАЮ ПРАВА НА ВЫПОЛНЕНИЕ ДЛЯ СКРИПТОВ:")
	chmod +x create_config_symlinks.sh
	chmod +x update_pip_modules.sh
	chmod +x generate_toc.py

run_scripts: make_executable
	$(call colorecho,"ЗАПУСКАЮ СКРИПТЫ:")
	./create_config_symlinks.sh

install_pyenv:
ifeq ($(OS),Darwin)
	$(call colorecho,"Установка на MacOS")
	brew install openssl readline sqlite3 xz zlib tcl-tk
else ifeq ($(OS),Linux)
	$(call colorecho,"Установка на Ubuntu")
	sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev curl \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
else
	$(call colorecho,"Неизвестная операционная система")
endif
ifeq ($(shell which pyenv > /dev/null  2>&1; echo $$?),  1)
install_pyenv:
	@$(call colorecho,"Установка pyenv")
	@curl https://pyenv.run | bash
else
install_pyenv:
	@$(call colorecho,"pyenv уже установлен")
endif

