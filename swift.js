const process = require('child_process');
const files = ["./Base/common.swift", "./Playground.playground/Contents.swift"]
const target = "./tmp.swift"

combine(files, target)
exec(`swift ${target}`)

function combine(files, target) {
    let cmd = `cat `
    for (file of files) {
        cmd += file + " "
    }
    cmd += `> ${target}`
    exec(cmd)
}

function exec(cmd) {
    process.exec(cmd, function(error, stdout, stderr) {
        console.log(stdout || error || stderr);
    });
}