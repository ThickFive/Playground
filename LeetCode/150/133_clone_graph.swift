/*	FILEPATH = "./LeetCode/150/133_clone_graph.swift"
 *	133. Clone Graph
	Given a reference of a node in a connected undirected graph.
	Return a deep copy (clone) of the graph.
	Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors.
	class Node {
	    public int val;
	    public List<Node> neighbors;
	}
	Test case format:
	For simplicity sake, each node's value is the same as the node's index (1-indexed). For example, the first node with val = 1, the second node with val = 2, and so on. The graph is represented in the test case using an adjacency list.
	Adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.
	The given node will always be the first node with val = 1. You must return the copy of the given node as a reference to the cloned graph.

	Example 1:
	Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
	Output: [[2,4],[1,3],[2,4],[1,3]]
	Explanation: There are 4 nodes in the graph.
	1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
	2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
	3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
	4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).

	Example 2:
	Input: adjList = [[]]
	Output: [[]]
	Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.

	Example 3:
	Input: adjList = []
	Output: []
	Explanation: This an empty graph, it does not have any nodes.

	Example 4:
	Input: adjList = [[2],[1]]
	Output: [[2],[1]]

	Constraints:
		1 <= Node.val <= 100
		Node.val is unique for each node.
		Number of Nodes will not exceed 100.
		There is no repeated edges and no self-loops in the graph.
		The Graph is connected and all nodes can be visited starting from the given node.
 */

/**
 * Definition for a Node.
 */
 public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var unique_nodes: [Int: Node] = [:]
        func clone_graph(_ node: Node?) -> Node? {
            guard let node = node else {
                return nil
            }
            if let node = unique_nodes[node.val] {
                return node
            }
            let new_node = Node(node.val)
            unique_nodes[node.val] = new_node
            var new_neighbors: [Node?] = []
            for neighbor in node.neighbors {
                if let new_neighbor = clone_graph(neighbor) {
                    new_neighbors.append(new_neighbor)
                }
            } 
            new_node.neighbors = new_neighbors
            return new_node
        }
        return clone_graph(node)
    }
}

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        let start = Date()
        print("\(start): Test start")
        code()
        let end = Date()
        print("\(end): Test end in \(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
    }
}

Test.run {
    let node1 = Node(1)
    let node2 = Node(2)
    let node3 = Node(3)
    let node4 = Node(4)
    node1.neighbors = [node2, node4]
    node2.neighbors = [node1, node3]
    node3.neighbors = [node2, node4]
    node4.neighbors = [node1, node3]
    print(Solution().cloneGraph(node1)!)
}