/*  使用说明: 
 *  在 https://leetcode.com/problems/xx-x-xxx/ 网页控制台中运行
    按照固定格式生成问题 xx-x-xxx 的注释并复制到剪切板
 */
(function main() {
    let title = parse_title();
    let lines = parse_content();
    let text = stringify(title, lines);
    console.log(text)
    if (copy_text(text) == true) {
        console.log("成功复制到剪切板");
    }
})()

function stringify(title, lines) {
    let file_name = title.match(/^\d+\.\s(.*)/)[1].toLowerCase().replace(/\s/g, '_');
    let text_start = `/*\tFILEPATH = "./LeetCode/${file_name}.swift"`;
    let text_tilte = ` *\t${title}`;
    let text_end   = ` */`;
    let text = [text_start, text_tilte, lines.join('\n'), text_end].join('\n')
    return text
}

function parse_title() {
    //  问题标题
    let question_title = document.querySelector('.css-v3d350').textContent;
    return question_title
}

function parse_content() {
    //  问题描述
    let question_content = document.querySelector('.content__u3I1.question-content__JfgR').textContent;
    //  去除多余空行
    let lines = question_content.split('\n').filter(line => {
        return line.length > 0 && line != " "   //  一个特殊的空白符号
    });
    //  每个例子前加上空行
    lines = lines.map(line => {
        if (line.indexOf('Example') != -1) {
            return '\n' + '\t' + line
        } else if (line.indexOf('Constraints') != -1) {
            return '\n' + '\t' + line
        } else {
            return '\t' + line
        }
    })
    return lines
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