# 目录结构 
```
├── Package.swift       必须
├── README.md
└── Sources             必须
   ├── TargetName       必须  
   |  └── main.swift    必须
   └── TargetName       [多个Target]
   ...
```
0. 下文中出现的`构建`指的是以 `$ swift build -c [debug|release]` 命令运行项目
1. 目录结构必须要是以上形式, 否则构建时出错 `error: root manifest not found`. [Swift on Linux —— Hello, world!](https://www.jianshu.com/p/f807c9b6540b)
2. Package.swift 需要在开头指定 swift-tools 版本, 否则构建时出错 `error: package at '.' is using Swift tools version 3.1.0 which is no longer supported; consider using '// swift-tools-version:5.3' to specify the current tools version`. [Package.swift toolchain 版本的选择](https://onevcat.com/2020/09/swift-package-version/)  
3. Package.swift 正确写法参见 [Package Manager](https://swift.org/package-manager/). Package.swift 格式不正确构建时会出现 `error: manifest parse error(s)` 或者 `error: malformed` 
# 相关命令
`$ swift package update`  
`$ swift build -c [debug|release]`  
 e.g. $ swift build -c release 以 release 模式构建, $ swift build 不填参数默认为 debug 模式