## The Ultimate vimrc
----
A quick vimrc for web programming
----
#### what does the vim focus on ?
* simple
* focus on web
* powerful

----
#### Some screenshots
Color when editing a ruby file:
<img width="700" alt="rb-t1" src="https://cloud.githubusercontent.com/assets/16079417/21079739/22c96814-bfd6-11e6-9f58-d0bbe948b798.png">

Opening recently opened files <a href="https://github.com/vim-scripts/mru.vim">mru.vim</a>:
<img width="700" alt="mru-file-t1" src="https://cloud.githubusercontent.com/assets/16079417/21079759/a149abae-bfd6-11e6-839b-abe0bcf0c282.png">

<a href="https://github.com/scrooloose/nerdtree">NERD Tree</a> plugin in a terminal window:
<img width="700" alt="screen shot 2016-12-11 at 19 22 50" src="https://cloud.githubusercontent.com/assets/16079417/21079774/4b1fcc6c-bfd7-11e6-802b-dda4235bd053.png">

----
## include plugins

### <a href="https://github.com/scrooloose/nerdtree">nerdtree</a>
<hr>
NERDTree is a file explorer plugin that provides "project drawer" functionality to your vim editing. You can learn more about it with `:help NERDTree`.

<b>QuickStart</b> Launch using `<c-e>`

### <a href="https://github.com/mbbill/undotree">undotree</a>
<hr>
If you undo changes and then make a new change, in most editors the changes you undid are gone forever, as their undo-history is a simple list. Since version 7.0 vim uses an undo-tree instead. If you make a new change after undoing changes, a new branch is created in that tree. Combined with persistent undo, this is nearly as flexible and safe as git ;-)
Undotree makes that feature more accessible by creating a visual representation of said undo-tree

<b> QuickStart</b> Launch using `<Leader>u`.

### <a href="https://github.com/jlanzarotta/bufexplorer">bufexplorer</a>
<hr>
With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces.

<b>QuickStart</b> Launch using `<Leader>o`

### <a href="https://github.com/kien/ctrlp.vim">ctrlp</a>

<hr>
Full path fuzzy file, buffer, mru, tag, ... finder for Vim.

<b>QuickStart</b> Launch using `<c-p>`

### <a href="https://github.com/scrooloose/nerdcommenter">nerdcommenter</a>
<hr>
Comment functions so powerful—no comment necessary.

<b>QuickStart</b> Launch using `<Leader>c<space>`

### <a href="https://github.com/valloric/youcompleteme">YouCompleteMe</a>
<hr>
YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim.

<b>QuickStart</b> Launch using `<c-j>`

### <a href="https://github.com/scrooloose/syntastic">syntastic</a>
<hr>
Syntastic is a syntax checking plugin that runs buffers through external syntax checkers as they are saved and opened. If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them.

### <a href="https://github.com/townk/vim-autoclose">autoclose</a>
<hr>
AutoClose does what you expect. It's simple, if you open a bracket, paren, brace, quote, etc, it automatically closes it. It handles curlys correctly and doesn't get in the way of double curlies for things like jinja and twig.

### <a href="https://github.com/tpope/vim-fugitive">fugitive</a>
<hr>
Fugitive adds pervasive git support to git directories in vim. For more information, use `help fugitive`

<b>QuickStart</b> `<learn>gs` show git status

### <a href="https://github.com/mileszs/ack.vim">ack</a>
<hr>
ack.vim uses ack to search inside the current directory for a pattern.

<b>QuickStart</b>`:Ack`

### <a href="https://github.com/majutsushi/tagbar">tagbar</a>
<hr>
<img width="700" alt="screen shot 2016-12-11 at 20 16 08" src="https://cloud.githubusercontent.com/assets/16079417/21080054/fe1a3962-bfdf-11e6-88e4-05a590b74af8.png">
Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. It does this by creating a sidebar that displays the ctags-generated tags of the current file, ordered by their scope.

<b>QuickStart</b>`<Leader>tt`

### <a href="https://github.com/easymotion/vim-easymotion">easymotion</a>
<hr>
<img width="700" alt="screen shot 2016-12-11 at 20 27 08" src="https://cloud.githubusercontent.com/assets/16079417/21080068/5c618f2a-bfe0-11e6-9f61-43eaa7965681.png">
EasyMotion provides a much simpler way to use some motions in vim.

<b>QuickStart</b>`<Leader><Leander>f`

### <a href="https://github.com/haya14busa/incsearch.vim">incsearch</a>
<hr>
<img width="700" alt="screen shot 2016-12-11 at 20 38 07" src="https://cloud.githubusercontent.com/assets/16079417/21080120/f748aa22-bfe1-11e6-9dfa-6dc62a99a1b9.png">
incsearch.vim incrementally highlights ALL pattern matches

<b>QuickStart<b>: `/ or ?`

<hr>
Acknowledgements
 * <a href="https://github.com/spf13/spf13-vim">spf13</a>
 * <a href="https://github.com/amix/vimrc"> amix/vimrc</a>
 * ...
