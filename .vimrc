"  Last update: 26.07.2023 16:45
" Составил Валерий Тропин
" tropin.one
"
" Источники:
" https://github.com/VundleVim/Vundle.vim#quick-start
" https://r-notes.ru/48-knigi/rukovodstvo-polzovatelya-vim/122-nastrojki.html
" https://dimio.org/fajl-nastrojki-vim-vimrc-dlya-linux-i-windows.html
" https://losst.pro/nastrojka-vim
" https://chugunkov.dev/2017/07/30/my-vim.html
" Некоторые комментарии в коде сгенерированы с помощью GPT 3.5

filetype on     " Без этой строчки Vim на macOS не загрузит список плагинов

" SETTINGS FROM VUNDLE:

" Disable compatibility mode
" Отключить режим совместимости (compatible mode)
set nocompatible

" Turn off automatic filetype detection
" Отключить автоматическое определение типа файла (filetype detection)
filetype off

" set the runtime path to include Vundle and initialize
" Добавить путь к плагину Vundle.vim в переменную runtimepath
set rtp+=~/.vim/bundle/Vundle.vim

" After calling vundle#begin(), you can specify the plugins you want
" to install in your Vim configuration by using the 'Plugin' command.
" The syntax for adding a plugin using Vundle is:
" Plugin 'github_username/plugin_repository_name'
" Keep Plugin commands between vundle#begin/end.

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Fugitive is the premier Vim plugin for Git.
" Command ':Git' or just ':G' calls any arbitrary Git command.
Plugin 'tpope/vim-fugitive'

" Command-T provides fast and efficient file navigation and fuzzy file search capabilities.
" It allows you to quickly open files in your project by typing a part of their name
" and using fuzzy matching to find the best match.
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" Sparkup provides a fast and efficient way to write HTML code using a syntax
" inspired by the Zen Coding (Emmet) syntax. It allows you to write HTML code
" more quickly and with fewer keystrokes.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" NERDTree provides a file explorer tree within Vim, allowing you to navigate
" and manage your files and directories right from the editor.
Plugin 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status flags.
Plugin 'Xuyuanp/nerdtree-git-plugin'

" ctrlp.vim provides a powerful and versatile fuzzy file finder.
Plugin 'ctrlpvim/ctrlp.vim'

" vim-easygrep simplifies and enhances the process of performing global search
" and replace operations within files and directories.
" Commands: ':Replace abc cba', ':Grep abc'.
Plugin 'dkprice/vim-easygrep'

" vim-devicons provides icon support in various parts of the Vim interface.
" Plugin 'ryanoasis/vim-devicons'

" vim-airline will automatically replace the default Vim status line
" with its own more visually appealing status line.
Plugin 'vim-airline/vim-airline'

" vim-airline-themes is an add-on plugin for "vim-airline" that provides
" additional themes and styles for the status line created by "vim-airline.
Plugin 'vim-airline/vim-airline-themes'

" Light & Dark Vim color schemes inspired by Google's Material Design
Plugin 'NLKNguyen/papercolor-theme'

" lightline.vim enhances the appearance of the status line in Vim.
" Plugin 'itchyny/lightline.vim'

" Automatically detect and activate the appropriate Python virtual environment
" when editing files inside a project that contains a virtual environment.
" Display the name of the currently active virtual environment in the Vim status line.
Plugin 'jmcantrell/vim-virtualenv'

" nerdcommenter provides easy and efficient commenting and uncommenting of code.
" To comment or uncomment code in normal mode: '\cc' for comment, '\cu' for uncomment.
Plugin 'scrooloose/nerdcommenter'

" nginx.vim provides syntax highlighting and other features specific to nginx configuration files.
Plugin 'chr4/nginx.vim'

" vim-rainbow enhances the syntax highlighting of brackets, parentheses,
" and other delimiter characters in various programming languages.
Plugin 'frazrepo/vim-rainbow'

" WakaTime plugin for an automatic time tracking.
Plugin 'wakatime/vim-wakatime'

" A vim 7.4+ plugin to generate table of contents for Markdown files.
Plugin 'mzlogin/vim-markdown-toc'

call vundle#end()

" Enables automatic detection and setting of the file type based on the file's extension or content.
" Enables the loading of filetype-specific plugin scripts and settings.
" Enables automatic indentation for certain file types.
filetype plugin indent on

" Brief help:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" MY SETTINGS

" Create a custom command 'W' to save the file with sudo privileges
" Создать команду 'W' для сохранения файла с правами суперпользователя (sudo)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Update the first line of .vimrc with the last update date and time
" Обновить первую строку .vimrc с информацией о последнем обновлении
autocmd! bufwritepre $MYVIMRC call setline(1, '"  Last update: '.strftime("%d.%m.%Y %H:%M"))

" Automatically reload the Vim configuration after saving
" Автоматически перезагружать конфигурацию Vim после сохранения
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Enable auto-reading of files
" Включить автоматическое обновление файлов
set autoread

" Enable confirmation before executing some dangerous commands
" Включить подтверждение перед выполнением некоторых опасных команд
set confirm

" Set the encoding to UTF-8
" Установить кодировку (encoding) в UTF-8
set encoding=utf8

" Set the preferred end-of-line formats to Unix, DOS, and Mac
" Установить предпочитаемые форматы конца строки в Unix, DOS и Mac
set ffs=unix,dos,mac

" Configure Backspace behavior
" Настройка поведения клавиши Backspace для удаления отступов (indent),
" перевода каретки (eol) и перемещения к началу предыдущих строк (start)
set backspace=indent,eol,start

" Enable auto-indentation
" Включить автоматическое выравнивание как у предыдущей строки
set autoindent

" Set command history size to 100
" Установить размер истории команд на 100
set history=100

" Enable status line (ruler)
" Включить строку статуса (линейку) в нижней части окна Vim
set ruler

" Set the appearance of the status line for different interfaces
" Установить внешний вид строки статуса для различных интерфейсов
hi StatusLine gui=reverse cterm=reverse

" Set the appearance of SpellBad highlighting
" Установить внешний вид подсветки для неправильно написанных слов
highlight SpellBad ctermfg=Black ctermbg=Red

" Show command in the status line
" Отображать текущую команду в строке статуса
set showcmd

" APPEARANCE
set t_Co=256

" PAPERCOLOR-THEME PLUGIN
" https://github.com/NLKNguyen/papercolor-theme
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

set background=dark

colo PaperColor

" VIM-AIRLINE PLUGIN
let g:airline_theme='papercolor'
let g:airline_enable_fugitive=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" COMMAND-T PLUGIN
let g:CommandTPreferredImplementation='ruby'    " need this for Neovim

" NERDTree PLUGIN
" Раскрытие и скрытие дерева по двойному нажатию на запятую
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" nerdcommenter PLUGIN
" Закомментировать стоку по Ctrl+/
nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>

" Automatically save the view when leaving a buffer
" Автоматически сохранять вид при закрытии буфера
au BufWinLeave *.* silent mkview

" Automatically load the view when entering a buffer
" Автоматически восстанавливать вид при открытии буфера
au BufWinEnter *.* silent loadview

" Define session options to save current directory, buffers, and tab pages
" Определить параметры сессии для сохранения текущего каталога, буферов и вкладок
set sessionoptions=curdir,buffers,tabpages

" Set the current directory as the browsing directory
" Установить текущий каталог в качестве каталога для просмотра
set browsedir=current

" Set the clipboard to use the unnamed register
" Установить обмен данными с буфером обмена через неименованный регистр,
" т.е., будет работать Ctrl+C, Ctrl+V
set clipboard=unnamed

" Enable window title
" Включить отображение заголовка окна
set title

" Map 'p' key in Visual mode to paste from a register
" При нажатии 'p' в режиме визуального выделения на место выделенного
" текста будет вставлено содержимое регистра '"'
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Enable syntax highlighting and search highlighting based on color support and GUI presence
" Включить подсветку синтаксиса и выделение результатов поиска на основе поддержки цветовой схемы и GUI
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" The wildmenu is a type of completion menu that appears when you press Tab
" to auto-complete file and command names.
set wildmenu

" Set textwidth to 78 for files with 'text' filetype
" Установить textwidth в 78 для файлов с типом 'text'
autocmd FileType text setlocal textwidth=78

" Move cursor to the position of the last edit mark after opening any file
" Переместить курсор на позицию последней метки редактирования после открытия любого файла
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Set horizontal scrolling by 10 columns
" Установить горизонтальную прокрутку на 10 колонок
set sidescroll=10

" Set the scroll offset to 3 lines
" Установить смещение прокрутки в 3 строки
set scrolloff=3

" Map F5 key to insert { } and move cursor between them
" Сопоставление клавиши F5 для вставки { } и перемещения курсора между ними
:map <F5> i{<Esc>ea}<Esc>

" Map '\p' key to insert ( ) and move cursor between them
" Сопоставление клавиши '\p' для вставки ( ) и перемещения курсора между ними
:map \p i(<Esc>ea)<Esc>

" Map '\c' key to insert { } and move cursor between them
" Сопоставление клавиши '\c' для вставки { } и перемещения курсора между ними
:map \c i{<Esc>ea}<Esc>

" TABULATION
" Enable smart tab behavior
" Включить умное поведение при нажатии клавиши Tab
set smarttab

" Enable expanding tabs to spaces
" Включить замену символов табуляции на пробелы
set expandtab

" Set the shiftwidth value to 4 spaces
" Установить значение shiftwidth равным 4 пробелам
set shiftwidth=4

" Set the tabstop value to 4 spaces
" Установить значение tabstop равным 4 пробелам
set tabstop=4

" Set the soft tabstop value to 4 spaces
" Установить значение softtabstop равным 4 пробелам
set softtabstop=4

" Enable line numbers
" Включить отображение номеров строк
set number

set laststatus=2

" PARENTHESES
" Set < and > as additional match pairs for auto-completion
" Установить < и > как дополнительные пары скобок для автодополнения
set mps+=<:>

" Enable showing matching parentheses
" Включить отображение соответствующей пары скобок
set showmatch

" Set 'b', 's', '<', '>', and '[]' as whichwrap options
" Установить 'b', 's', '<', '>', и '[]' как опции whichwrap
" Нормальное перемещение на предыдущую и следующую строки помимо 'j' и 'k'
set whichwrap=b,s,<,>,[]

" Enable displaying of non-printable characters
" Включить отображение непечатаемых символов:
" '^I' — табуляция, '·' — пробелы, '$' — концы строк, '^M' — возврат каретки
set list

" Define custom listchars for displaying non-printable characters
" Определить пользовательские listchars для отображения непечатаемых символов
set listchars=tab:..,trail:-

" Enable incremental search
" Включить инкрементальный поиск
set incsearch

" Highlight the current word under the cursor
" Подсветить текущее слово под курсором
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand(''))

" Set ignorecase mode for search
" Установить режим игнорирования регистра при поиске
set ignorecase

" Set smartcase mode for search
" Установить умный режим игнорирования регистра при поиске
set smartcase

" Enable mouse support
" Включить поддержку мыши
set mouse=a

" Set the completion options to display a menu and preview window
" Установить опции автозавершения для отображения всплывающего меню и окна предпросмотра
set completeopt=menu,preview

