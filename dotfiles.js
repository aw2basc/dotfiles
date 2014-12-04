var fs = require('fs'),
    path = require('path'),
    iswin = process.platform === 'win32',
    home = process.env[iswin ? 'USERPROFILE' : 'HOME'],
    dot = iswin ? '_' : '.',
    dotfiles = ['vimrc','jshintrc'];

dotfiles.forEach(function(dotfile){
    var curfile = path.join(__dirname, dotfile),
        destfile = path.join(home, dot + dotfile),
        bak = destfile + Date.now(),
        link = function(e){
            if(e)throw e;
            fs.symlink(curfile, destfile, function(e){if(e)throw e;});
        };
    fs.lstat(destfile,function(e,stats){
        if(e)link();
        else if(stats.isFile())
            fs.rename(destfile, bak, link);
        else if(stats.isSymbolicLink())
            fs.unlink(destfile, link);
    });
});
