var fs = require('fs'),
    path = require('path'),
    spawn = require('child_process').spawn,
    iswin = process.platform === 'win32',
    home = process.env[iswin ? 'USERPROFILE' : 'HOME'],
    dot = iswin ? '_' : '.',
    dotfiles = ['vimrc'];

dotfiles.forEach(function(dotfile){
    var curfile = path.join(__dirname, dotfile),
        destfile = path.join(home, dot + dotfile),
        bak = destfile + Date.now(),
        link = function(e){
            if(e)throw e;
            fs.symlink(curfile, destfile, function(e){if(e)throw e;});
        };
    fs.lstat(destfile,function(err, stats){
        if(err)link();
        else if(stats.isFile())
            fs.rename(destfile, bak, link);
        else if(stats.isSymbolicLink())
            fs.unlink(destfile, link);
    });
});
