var fs = require('fs'),
    path = require('path'),
    spawn = require('child_process').spawn,
    home = process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME'],
    dotfiles = ['vimrc'];

dotfiles.forEach(function(dotfile){
    var curfile = path.join(__dirname, dotfile),
        destfile = path.join(home, '.' + dotfile),
        bak = destfile + Date.now(),
        link = function(e){
            if(e)throw e;
            fs.symlink(curfile, destfile);
        };
    fs.lstat(destfile, function(err, stats){
        if(err)link(); 
        else if(stats.isFile())
            fs.rename(destfile, bak, link);
        else if(stats.isSymbolicLink())
            fs.unlink(destfile, link);
    });
});
