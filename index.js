const fs = require('fs');
const contentsPath = "./Playground.playground/Contents.swift";
const tmpPath = "./tmp.swift";

function parseArguments() {
    //  前两个参数为node程序位置(/usr/local/bin/node)和当前脚本文件名(.../index.js)
    let argvs = {};
    argvs.actionType = process.argv.length > 2 ? process.argv[2] : '';
    argvs.filePath = process.argv.length > 3 ? process.argv[3] : tmpPath;
    console.log(argvs);
    return argvs;
}

function save(filePath) {
    copyFile(contentsPath, filePath);
}

function load(filePath) {
    copyFile(filePath, contentsPath);
}

function copyFile(fromPath, toPath) {
    let data = fs.readFile(fromPath, (err, data) => {
        if (!err) {
            fs.writeFile(toPath, data, (err) => {
                if (err) {
                    console.log('error: write file', err);
                } else {
                    console.log(`success copy file from ${fromPath} to ${toPath}`);
                } 
            })
        } else {
            console.log('error: read file', err);
        }
    })
}

function main() {
    let argvs = parseArguments();
    if (argvs.actionType == 'save') {
        save(argvs.filePath);
    } else if (argvs.actionType == 'load') {
        load(fileargvs.filePathPath);
    } else {
        console.log(`error: action type '${argvs.actionType}' is not exist, use 'save' or 'load'`);
    }
}

main();