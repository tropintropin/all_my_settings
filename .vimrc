" Файл настроек для текстового редактора Vim/Neovim
" Составил Валерий Тропин
" tropin.one
"
" Источники:
" https://github.com/VundleVim/Vundle.vim#quick-start
" https://r-notes.ru/48-knigi/rukovodstvo-polzovatelya-vim/122-nastrojki.html
" Некоторые комментарии в коде сгенерированы с помощью ChatGPT May 24 Version:
" https://chat.openai.com/share/4d96924c-6691-4ddf-a1a2-b943c317bf25

" SETTINGS FROM VUNDLE:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" MY SETTINGS
" 
" Automatically reload the Vim configuration after saving
" Автоматически перезагружать конфигурацию Vim после сохранения
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
" Enable auto-reading of files
" Включить автоматическое обновление файлов
set autoread
" Enable confirmation before executing some dangerous commands
" Включить подтверждение перед выполнением некоторых опасных команд
set confirm
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
" Define a custom statusline format
" Определить пользовательский формат строки статуса
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" Set the appearance of the status line for different interfaces
" Установить внешний вид строки статуса для различных интерфейсов
hi StatusLine gui=reverse cterm=reverse
" Set the appearance of SpellBad highlighting
" Установить внешний вид подсветки для неправильно написанных слов
highlight SpellBad ctermfg=Black ctermbg=Red
" Show command in the status line
" Отображать текущую команду в строке статуса
set showcmd
" Automatically save the view when leaving a buffer
" Автоматически сохранять вид при закрытии буфера
au BufWinLeave *.* silent mkview
" Automatically load the view when entering a buffer
" Автоматически восстанавливать вид при открытии буфера
au BufWinEnter *.* silent loadview
" Enable incremental search
" Включить инкрементальный поиск
set incsearch
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
" Enable support for filetypes, plugins, and auto-indentation
" Включить поддержку файловых типов, плагинов и автоматическое определение отступов
" filetype plugin indent on   " Отключено, т.к. того требует Vundle (см. выше)
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
" Set the command line height to 3 lines
" Установить высоту командной строки в 3 строки
set cmdheight=3
" Enable mouse support
" Включить поддержку мыши
set mouse=a
