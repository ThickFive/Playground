/*  书签形式执行 JavaScript 脚本
 *  使用方式:
    1. 将代码片段通过 https://babeljs.io/repl/ 转译至 ES5, 因为下面的压缩工具只支持 ES5
    2. 转译后的代码通过 https://tool.oschina.net/jscompress/ 压缩至一行
    3. 在 Chrome 浏览器空白页添加新的书签, 修改书签网址栏内容为 "javascript:压缩后的代码"
    4. 浏览网页时点击添加的书签即可自动执行脚本
    注: 如果以 "use strict"; 开头, 严格模式下必须保证所有代码都符合要求, 比如 for(i in [1,2,3]) 必须写成 for(let i in [1,2,3]) 的形式才不会报错
 */

// LeetCode 问题注释: 适用于 https://leetcode.com/problems/具体子问题
(function leetcode_web_parse() {
    (function main() {
        if (window.location.href.match(/leetcode.com\/problems\/.*?\//)) {
            let title = parse_title();
            let contents = parse_content();
            let codes = parse_code();
            let test = test_code();
            let text = stringify(title, contents, codes, test);
            copy_text(text) ? alert("成功复制到剪切板") : '';
            console.log(text);
        } else {
            window.open('https://leetcode.com/problems/two-sum/', "_blank", "");
        }
    })();
    
    function stringify(title, contents, codes, test) {
        let match = title.match(/^(\d+)\.\s(.*)/);
        let file_index = match[1];
        let file_dir = Math.floor((file_index - 1) / 50) * 50 + 50;
        let file_name = file_index + "_" + match[2].toLowerCase().replace(/\s/g, '_');
        let text_start = `/*\tFILEPATH = "./LeetCode/${file_dir}/${file_name}.swift"`;
        let text_tilte = ` *\t${title}`;
        let text_content = contents.join('\n');
        let text_end   = ` */`;
        let code = codes.join('\n');
        let text = [text_start, text_tilte, text_content, text_end, '', code, '', test].join('\n');
        return text;
    }
    
    function parse_title() {
        //  问题标题
        let question_title = document.querySelector('.css-v3d350').textContent;
        return question_title;
    }
    
    function parse_content() {
        //  问题描述
        let question_content = document.querySelector('.content__u3I1.question-content__JfgR').textContent;
        //  去除多余空行
        let lines = question_content.split('\n').filter(line => {
            return line.length > 0 && line != " ";   //  一个特殊的空白符号
        });
        //  每个例子前加上空行
        lines = lines.map(line => {
            if (line.indexOf('Example') != -1) {
                return '\n' + '\t' + line;
            } else if (line.indexOf('Constraints') != -1) {
                return '\n' + '\t' + line;
            } else {
                return '\t' + line;
            }
        });
        return lines;
    }
    
    function parse_code() {
        let codes = document.querySelector('.CodeMirror-code').innerText.split('\n');
        let lines = [];
        for (let index in codes) {
            if (index % 2 == 1) {   //  剔除行号
                let line = codes[index].replace(/\u00A0/g, " ");
                lines.push(line);
            }
        }
        return lines;
    }
    
    function test_code() {
        let test_code = `/*
     *  TEST
     */
    import Foundation
    class Test {
        class func run(_ code:() -> ()) {
            let start = Date()
            print("\\(start): Test start")
            code()
            let end = Date()
            print("\\(end): Test end in \\(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
        }
    }
    
    Test.run {
        
    }`
       return test_code;
    }
    
    //  复制到剪切板
    function copy_text(text) {
        var textarea = document.createElement("textarea"); //创建input对象
        var currentFocus = document.activeElement; //当前获得焦点的元素
        var toolBoxwrap = document.getElementById('app'); //将文本框插入到NewsToolBox这个之后
        toolBoxwrap.appendChild(textarea); //添加元素
        textarea.value = text;
        textarea.focus();
        if (textarea.setSelectionRange) {
            textarea.setSelectionRange(0, textarea.value.length); //获取光标起始位置到结束位置
        } else {
            textarea.select();
        }
        try {
            var flag = document.execCommand("copy"); //执行复制
        } catch (eo) {
            var flag = false;
        }
        toolBoxwrap.removeChild(textarea); //删除元素
        currentFocus.focus();
        return flag;
    }
})();

// Google 翻译选中文本: 适用于所有页面
(function google_translate() {
    let keyword = window.getSelection().toString();
    let url = `https://translate.google.cn/?hl=zh-CN&sl=auto&tl=en&text=${keyword}&op=translate`;
    window.open(url, "_blank", "");
})();

//  Baidu 搜索选中文本: 适用于所有页面
(function baidu_search() {
    let keyword = window.getSelection().toString();
    let url = `https://www.baidu.com/s?wd=${keyword}`;
    window.open(url, "_blank", "");
})();