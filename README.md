# All My Settings & Dotfiles

[![wakatime](https://wakatime.com/badge/user/45d08a79-2677-4493-83b7-77be5bfef3a9/project/bd858417-61db-4956-9166-d6f1bd51569f.svg)](https://wakatime.com/badge/user/45d08a79-2677-4493-83b7-77be5bfef3a9/project/bd858417-61db-4956-9166-d6f1bd51569f)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
<img src="https://img.shields.io/badge/VIM-%2311AB00.svg?&style=for-the-badge&logo=vim&logoColor=white" alt="vim" height="20" style="border-radius:3px">
<img src="https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white" alt="tmux" height="20" style="border-radius:3px">

Репа для всех моих файлов настроек.

<!-- vim-markdown-toc GFM -->

* [Настраиваем новую машину](#Настраиваем-новую-машину)
    * [Скрипт](#Скрипт)
    * [Ручная настройка](#Ручная-настройка)
        * [Bash](#bash)
        * [Zsh](#zsh)
        * [Vim](#vim)
        * [Tmux](#tmux)
        * [Git](#git)
* [Обновляем устаревшие пакеты pip](#Обновляем-устаревшие-пакеты-pip)
* [Обновляем оглавление этого файла](#Обновляем-оглавление-этого-файла)

<!-- vim-markdown-toc -->

## Настраиваем новую машину

Чтобы изменения в файлах внутри репозитория сразу же отражались на реальных файлах конфигурации в системе, необходимо настроить символические ссылки на каждый из них.

### Скрипт

Симлинки можно сделать вручную, а можно с помощью скрипта [`create_config_symlinks.sh`](create_config_symlinks.sh), лежащего в корне этого репозитория.

Скрипту необходимо дать права на выполнение:

```bash
chmod +x create_config_symlinks.sh
```

и только потом запускать:

```bash
./create_config_symlinks.sh
```

<details>
  <summary>Детали работы скрипта</summary>
    <ol>
      <li>Заходим в директорию скрипта с помощью команды <code>cd</code>. Путь до неё берём из переменной <code>${BASH_SOURCE[0]}</code>.</li>
      <li>Определяем абсолютный путь до директории со скриптом (и, соответственно, с файлами) с помощью <code>pwd</code>.</li>
      <li>Объявляем функцию <code>check_and_create_symlink()</code>, которая принимает на вход имя конфигурационного файла и производим проверки:
        <ul>
          <li>Если симлинк уже существует и указывает на нужный нам файл, то ничего не делаем.</li>
          <li>Если симлинк есть, но ведёт в другое место, то перезаписываем его на файл из той директории, в которой находится скрипт.</li>
          <li>Если симлинка нет, то создаём его.</li>
          <li>Путь до домашней папки определяем с помощью переменной <code>$HOME</code>.</li>
        </ul>
      <li>Имена конфигурационных файлов храним в массиве <code>files</code>. Мы итерируемся по этому массиву в цикле <code>for</code> и передаём имя каждого файла в функцию <code>check_and_create_symlink()</code> в качестве аргумента.</li>
      <li>В конце выводим в консоль сообщение о том, что работа скрипта завершена.</li>
    </ol>
</details>


### Ручная настройка

#### Bash

```sh
ln -sf /path/to/your/repository/.bashrc ~/.bashrc
```

#### Zsh

0. Устанавливаем `zsh`, если ещё не установлена:

    * Ubuntu:

        ```sh
        sudo apt update
        sudo apt install zsh
        ```

    * На macOS, обычно, `zsh` уже установлена и является оболочкой по умолчанию. Если нет, то запускаем:

        ```sh
        brew install zsh
        ```

0. Запускаем `zsh` и устанавливаем её как оболочку по умолчанию.

0. Устанавливаем `oh-my-zsh`:

    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

    или:

    ```sh
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    ```
0. [Клонируем](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) плагин `zsh-autosuggestions` в директорию с кастомными плагинами `oh-my-zsh`:
    ```sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

0. [Клонируем](https://github.com/MichaelAquilina/zsh-you-should-use) плагин `you-should-use` туда же:
    ```sh
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
    ```

0. Создаём симлинк для `.zshrc`:

    ```sh
    ln -sf /path/to/your/repository/.zshrc ~/.zshrc
    ```

#### Vim

0. Создаём файл `.vimrc` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.vimrc
    ```

0. Создаём симлинк для `.vimrc`:

    ```sh
    ln -sf /path/to/your/repository/.vimrc ~/.vimrc
    ```

0. Устанавливаем [`Vundle`](https://github.com/VundleVim/Vundle.vim#quick-start):

    ```sh
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

0. Запускаем `Vim` и устанавливаем плагины:

    ```vim
    :PluginInstall
    ```

    или:

    ```vim
    :PluginUpdate
    ```

    или делаем то же самое из командной строки:

    ```sh
    vim +PluginInstall +qall
    ```

__NB!__ В macOS Vim может ругаться при подключении Vundle. Дело решается следующим кодом:

```vim
filetype on     " сначала включаем
filetype off    " затем выключаем для Vundle
" Vundle settings + plugins initialization
filetype on     " вновь включаем для дальнейшей настройки
" Other Vim settings
```

Перезапускать конфиг Vim можно не выходя из него, по команде:

```vim
:source %
```

Один и тот же `.vimrc` файл можно использовать как для Vim, так и для Neovim. Для его подключения к последнему придётся сделать [небольшую](https://neovim.io/doc/user/nvim.html#nvim-from-vim) донастройку.

#### Tmux

0. Создаём файл `.tmux.conf` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.tmux.conf
    ```

0. Создаём симлинк для `.tmux.conf`:

    ```sh
    ln -sf /path/to/your/repository/.tmux.conf ~/.tmux.conf
    ```

0. Запускаем Tmux и устанавливаем плагины:

    ```tmux
    <prefix> + I
    ```

#### Git

0. Создаём файл `.gitconfig` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.gitconfig
    ```

0. Создаём симлинк для `.gitconfig`:

    ```sh
    ln -sf /path/to/your/repository/.gitconfig ~/.gitconfig
    ```

## Обновляем устаревшие пакеты pip

Из директории с питоновским проектом, из-под запущенного виртуального окружения запускаем скрипт [`update_pip_modules.sh`](update_pip_modules.sh).

Перед первым запуском скрипту может потребоваться дать права на выполнение:

```bash
chmod +x update_pip_modules.sh
```

## Обновляем оглавление этого файла

В случае, если в этот файл были добавлены новые пункты или изменилась структура разделов,
можно создать новое оглавление с помощью питоновского скрипта [`generate_toc.py`](generate_toc.py).

Скрипт запускается из терминала по следующей команде:

```bash
python generate_toc.py README.md
```

Вторым аргументом можно подставить любой другой md-файл.

Скрипт пробежится по файлу и создаст многоуровневое оглавление для всех заголовков, а затем добавит его *в начало* препарируемого файла.

> Но можно просто установить в ваш редактор плагин, который умеет делать и обновлять оглавление для md-файлов. Например, [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc) для Vim'а.
