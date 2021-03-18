const fs = require('fs');
const contentsPath = "./Playground.playground/Contents.swift";
const tmpPath = "./tmp.swift";

function parseArguments() {
    //  前两个参数为node程序位置(/usr/local/bin/node)和当前脚本文件名(.../index.js)
    let argvs = {};
    argvs.actionType = process.argv.length > 2 ? process.argv[2] : '';
    argvs.filePath = process.argv.length > 3 ? process.argv[3] : tmpPath;
    console.log(argvs)
    return argvs;
}

function save(filePath) {
    copyFile(contentsPath, filePath, true);
}

function load(filePath) {
    copyFile(filePath, contentsPath, false);
}

function copyFile(fromPath, toPath, isSave) {
    fs.readFile(fromPath, (err, data) => {
        if (!err) {
            if (isSave && toPath == tmpPath) {  // 保存时未指定文件路径
                let fulltext = String(data)
                let res = fulltext.match('FILEPATH = "(.*?)"');
                if (res && res.length > 1) {
                    toPath = res[1];
                    console.log(`success match file path: ${toPath}`)
                }
            }
            if (fs.existsSync(toPath) == false) {
                mkdir(toPath);
            }
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

function mkdir(filePath) {
    const dirCache={};
    const arr=filePath.split('/');
    let dir=arr[0];
    for(let i=1;i<arr.length;i++){
        if(!dirCache[dir]&&!fs.existsSync(dir)){
            dirCache[dir]=true;
            fs.mkdirSync(dir);
            console.log(`mkdir: ${dir}`);
        }
        dir=dir+'/'+arr[i];
    }
    fs.writeFileSync(filePath, '');
}

function main() {
    let argvs = parseArguments();
    if (argvs.actionType == 'save') {
        save(argvs.filePath);
    } else if (argvs.actionType == 'load') {
        load(argvs.filePath);
    } else {
        console.log(`error: action type '${argvs.actionType}' is not exist, use 'save' or 'load'`);
    }
}

main();