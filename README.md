# all_my_settings

Репа для всех моих файлов настроек.

## Настраиваем новую машину

Чтобы изменения в файлах внутри репозитория сразу же отражались на реальных файлах конфигурации в системе, необходимо настроить симлинки на каждый из них.

### `bash`

```sh
ln -sf /path/to/your/repository/.bashrc ~/.bashrc
```

### `zsh`

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

0. Создаём симлинк для `.zshrc`:

    ```sh
    ln -sf /path/to/your/repository/.zshrc ~/.zshrc
    ```

### `vim`

0. Создаём файл `.vimrc` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.vimrc
    ```

0. Создаём симлинк для `.vimrc`:

    ```sh
    ln -sf /path/to/your/repository/.vimrc ~/.vimrc
    ```

0. Устанавливаем `Vundle` ([справка](https://github.com/VundleVim/Vundle.vim#quick-start)):

    ```sh
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

0. Запускаем `vim` и устанавливаем плагины:

    ```vim
    :PluginInstall
    ```

    или делаем то же самое из командной строки:

    ```sh
    vim +PluginInstall +qall
    ```

### `tmux`

0. Создаём файл `.tmux.conf` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.tmux.conf
    ```

0. Создаём симлинк для `.tmux.conf`:

    ```sh
    ln -sf /path/to/your/repository/.tmux.conf ~/.tmux.conf
    ```