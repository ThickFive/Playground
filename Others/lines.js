const process = require('child_process');
const username = "ThickFive";
const since = "2021-1-1";
const until = "2021-12-31";
var cmd = `git log --author="${username}" --pretty=tformat: --since ==${since} --until=${until} --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s,total lines: %s", add, subs, loc }'`
process.exec(cmd, function(error, stdout, stderr) {
    console.log(stdout);
});