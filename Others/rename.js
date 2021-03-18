const fs = require('fs');

//  需要在上一级目录下(/Playground)执行
function main() {
    let dir = './LeetCode'
    fs.readdir(dir, (err, data) => {
        if (err) {
            console.log(err);
        } else {
            for (let filename of data) {
                let path = dir + '/' + filename;
                if (fs.statSync(path).isFile()) {
                    console.log(path);
                    fs.readFile(path, (err, data) => {
                        if (!err) {
                            let fulltext = String(data);
                            let match = fulltext.match(/(\d+)\.\s(.*)/);
                            let file_index = match[1];
                            let file_dir = Math.floor((file_index - 1) / 50) * 50 + 50;
                            let file_name = file_index + "_" + match[2].toLowerCase().replace(/\s/g, '_');

                            let filepath = `./LeetCode/${file_dir}/${file_name}.swift`;
                            fulltext = fulltext.replace(/\.\/LeetCode.*swift/, filepath);

                            fs.writeFile(filepath, fulltext, (err) => {
                                if (err) {
                                    console.log('error: write file', err);
                                } else {
                                    console.log(`success copy file to ${filepath}`);
                                } 
                            })
                        }
                    })
                }
            }
        }
    })
}

main();