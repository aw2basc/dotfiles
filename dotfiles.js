var fs = require('fs'),
    { exec } = require('child_process'),
    path = require('path'),
    iswin = process.platform === 'win32',
    home = process.env[iswin ? 'USERPROFILE' : 'HOME'],
    dot = iswin ? '_' : '.',
    dotfiles = ['vimrc','jshintrc','zshrc','gitignore_global'];

console.log("dotfiles:");
dotfiles.forEach(function(dotfile){
    var curfile = path.join(__dirname, dotfile),
        destfile = path.join(home, dot + dotfile),
        bak = destfile + Date.now(),
        link = function(e){
            if(e)throw e;
            fs.symlink(curfile, destfile, function(e){if(e)throw e;});
            console.log("linked:" + curfile + "->" + destfile); 
        };
    fs.lstat(destfile,function(e,stats){
        if(e){
          link();
        }else if(stats.isFile()){
            console.log("renamed:" + destfile);
            fs.rename(destfile, bak, link);
        }else if(stats.isSymbolicLink()){
            console.log("unlinked:" + destfile);
            fs.unlink(destfile, link);
        }
    });
});
if (!iswin) {
  exec("git config --global core.excludesfile ~/.gitignore_global", (e,stdo,stde) => {
    if (e || stdo || stde){
      console.log(e + stde + stdo);
    }
    exec("git config --global --list", (e, stdo, stde) => {
      console.log("\ngit config:\n" + stdo);
    });
  });
}
