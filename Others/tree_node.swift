/*
 *  遍历二叉树
                       0
                      / \
                     11  12
                    /   / \
                   20  21  22
                      / \
                     31  32
 
     层序遍历: [0, 11, 12, 20, 21, 22, 31, 32]
     前序遍历: [0, 11, 20, 12, 21, 31, 32, 22]
     中序遍历: [20, 11, 0, 31, 21, 32, 12, 22]
     后序遍历: [20, 11, 31, 32, 21, 22, 12, 0]
 
 */

class Stack<T> {
    var _list: [T] = []
    
    func push(_ item: T?) {
        guard let item = item else {
            return
        }
        _list.append(item)
    }
    
    func pop() -> T? {
        let item =  _list.count > 0 ? _list[_list.count - 1] : nil
        if let _ = item {
            _list.remove(at: _list.count - 1)
        }
        return item
    }
    
    func isEmpty() -> Bool {
        return _list.count == 0
    }
}

class Queue<T> {
    var _list: [T] = []
    
    func push(_ item: T?) {
        guard let item = item else {
            return
        }
        _list.append(item)
    }
    
    func pop() -> T? {
        let item =  _list.count > 0 ? _list[0] : nil
        if let _ = item {
            _list.remove(at: 0)
        }
        return item
    }
    
    func isEmpty() -> Bool {
        return _list.count == 0
    }
}

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    class func makeTreeNode() -> TreeNode {
        let root_node = TreeNode(0)
        root_node.left = TreeNode(11)
        root_node.left?.left = TreeNode(20)
        root_node.right = TreeNode(12)
        root_node.right?.left = TreeNode(21)
        root_node.right?.left?.left = TreeNode(31)
        root_node.right?.left?.right = TreeNode(32)
        root_node.right?.right = TreeNode(22)
        
        return root_node
    }
}

class Solution {
    class func levelOrder(_ node: TreeNode?) -> [TreeNode] {
        var list: [TreeNode] = []
        let queue_0 = Queue<TreeNode>()
        let queue_1 = Queue<TreeNode>()

        //  初始化 queue_0 传入根节点
        queue_0.push(node)
        
        var tmp_0 = node
        while tmp_0 != nil {
            //  1. 添加当前节点
            if (queue_0.isEmpty()) {
                while let tmp_1 = queue_1.pop() {
                    list.append(tmp_1)
                    queue_0.push(tmp_1.left)
                    queue_0.push(tmp_1.right)
                }
                if (queue_0.isEmpty()) {
                    break
                }
            } else {
                tmp_0 = queue_0.pop()
                if let tmp_0 = tmp_0 {
                    list.append(tmp_0)
                    queue_1.push(tmp_0.left)
                    queue_1.push(tmp_0.right)
                }
            }
            
        }
        return list
    }
    
    class func prevOrder(_ node: TreeNode?) -> [TreeNode] {
        var list: [TreeNode] = []
        func _prevOrder(_ node: TreeNode?) {
            if let node = node {
                list.append(node)
                _prevOrder(node.left)
                _prevOrder(node.right)
            }
        }
        _prevOrder(node)
        return list
    }
    
    class func midOrder(_ node: TreeNode?) -> [TreeNode] {
        var list: [TreeNode] = []
        func _midOrder(_ node: TreeNode?) {
            if let node = node {
                _midOrder(node.left)
                list.append(node)
                _midOrder(node.right)
            }
        }
        _midOrder(node)
        return list
    }
    
    class func postOrder(_ node: TreeNode?) -> [TreeNode] {
        var list: [TreeNode] = []
        func _postOrder(_ node: TreeNode?) {
            if let node = node {
                _postOrder(node.left)
                _postOrder(node.right)
                list.append(node)
            }
        }
        _postOrder(node)
        return list
    }
}

[
    Solution.levelOrder(TreeNode.makeTreeNode()),
    Solution.prevOrder(TreeNode.makeTreeNode()),
    Solution.midOrder(TreeNode.makeTreeNode()),
    Solution.postOrder(TreeNode.makeTreeNode())
].map({ (item: [TreeNode]) -> [Int] in
    let result = item.map({$0.value})
    print(result)
    return result
})
