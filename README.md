dotfiles
========

###links   
[Vundle](https://github.com/gmarik/Vundle.vim.git)   
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`   

[YouCompleteMe](https://valloric.github.io/YouCompleteMe)  
`npm install -g tern typescript`  
`sudo apt-get install build-essential cmake python-dev python3-dev`  
`~/.vim/bundle/YouCompleteMe/install.py --js-completer --cs-completer`  
`cd ~/.vim/bundle/vimproc.vim && make`  

[nerd fonts](https://github.com/ryanoasis/nerd-fonts#font-installation)  
[oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
[pl9k](https://github.com/Powerlevel9k/powerlevel9k)

##wsl
add [win32yank] to C:\Windows\System32
`sudo apt remove xclip`

##windows
[cmake](https://cmake.org/download/)  
[mingw](https://sourceforge.net/projects/mingw/files/) mingw32-gcc mingw32-make
mingw in path `C:\MinGW\bin`
make sure python and vim are same 32/64bit version  
msbuild in path `C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin`  
C:\Users\jmaxwell3\.vim\bundle\vimproc.vim `mingw32-make -f make_mingw32.mak`
C:\Users\jmaxwell3\.vim\bundle\YouCompleteMe `install.py --cs-completer --js-completer`
