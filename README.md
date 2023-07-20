# All My Settings

Репа для всех моих файлов настроек.

- [Настраиваем новую машину](#настраиваем-новую-машину)
    - [Скрипт](#скрипт)
    - [Ручная настройка](#ручная-настройка)
      - [`bash`](#`bash`)
      - [`zsh`](#`zsh`)
      - [`vim`](#`vim`)
      - [`tmux`](#`tmux`)
- [Обновляем оглавление этого файла](#обновляем-оглавление-этого-файла)

## Настраиваем новую машину

Чтобы изменения в файлах внутри репозитория сразу же отражались на реальных файлах конфигурации в системе, необходимо настроить симлинки на каждый из них.

### Скрипт

Симлинки можно сделать вручную, а можно с помощью скрипта [`create_config_symlinks.sh`](create_config_symlinks.sh), лежащего в корне этого репозитория.

Скрипту необходимо дать ему права на выполнение:

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
          <li>Если символическая ссылка уже существует и указывает на нужный нам файл, то ничего не делаем.</li>
          <li>Если симлинк есть, но ведёт в другое место, то перезаписываем его на файл из той директории, в которой находится скрипт.</li>
          <li>Если симлинка нет, то создаём её.</li>
          <li>Путь до домашней папки определяем с помощью переменной <code>$HOME</code>.</li>
        </ul>
      <li>Имена конфигурационных файлов храним в массиве <code>files</code>. Мы итерируемся по этому массиву в цикле <code>for</code> и передаём имя каждого файла в функцию <code>check_and_create_symlink()</code> в качестве аргумента.</li>
      <li>В конце выводим в консоль сообщение о том, что работа скрипта завершена.</li>
    </ol>
</details>


### Ручная настройка

#### `bash`

```sh
ln -sf /path/to/your/repository/.bashrc ~/.bashrc
```

#### `zsh`

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

#### `vim`

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

#### `tmux`

0. Создаём файл `.tmux.conf` в домашней папке, если его ещё в ней нет:

    ```sh
    touch ~/.tmux.conf
    ```

0. Создаём симлинк для `.tmux.conf`:

    ```sh
    ln -sf /path/to/your/repository/.tmux.conf ~/.tmux.conf
    ```

## Обновляем оглавление этого файла

В случае, если в этот файл были добавлены новые пункты или изменилась структура разделов,
можно создать новое оглавление с помощью питоновского скрипта [`generate_toc.py`](generate_toc.py).

Скрипт запускается из терминала по следующей команде:

```sh
python generate_toc.py README.md
```

Вторым аргументом можно подставить любой другой md-файл.

Скрипт пробежится по файлу и создаст многоуровневое оглавление для всех заголовков, а затем добавит его *в начало* препарируемого файла.