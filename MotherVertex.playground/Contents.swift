import UIKit

var str = "Hello, playground"
var MAX = 4
struct Stack<T> {
    var list:[T]
    
    mutating func push(data:T) {
        list.append(data)
    }
    
    mutating func pop() -> Any {
        if list.isEmpty {
            return -1
        }else {
            return list.removeFirst()
        }
    }
}

class Graph {
    var listOfVertices = [[Int]]()
    
    init() {
        for index in 0...MAX {
            listOfVertices.append([index])
        }
    }
    
    func addEdge(vertex:Int, width:Int) {
        listOfVertices[vertex].append(width)
    }
    
    func printEdges()  {
        for vertices in listOfVertices {
            print(vertices)
        }
    }
    
    func getMotherVertices(start:Int) -> [Int] {
        var visited = [Int:Bool]()
        
        for index in 0...MAX {
            visited[index] = false
        }
        
        var stack = Stack(list: [])
        stack.push(data: start)
        visited[start] = true
        
        var visitedElements:[Int] = []
        
        while !stack.list.isEmpty {
            let s = stack.pop()
            visitedElements.append(s as! Int)
            
            if visitedElements.count == listOfVertices.count {
                print("Mother vertex is \(start)")
                break;
            }
            
            for item in listOfVertices[s as! Int] {
                if visited[item] == false {
                    visited[item] = true
                    stack.push(data: item)
                }
            }
        }
        
        return []
    }
}

var graph = Graph()
//graph.addEdge(vertex: 0, width: 1)
//graph.addEdge(vertex: 0, width: 2)
//graph.addEdge(vertex: 1, width: 3)
//graph.addEdge(vertex: 4, width: 1)
//graph.addEdge(vertex: 5, width: 2)
//graph.addEdge(vertex: 5, width: 6)
//graph.addEdge(vertex: 6, width: 0)
//graph.addEdge(vertex: 6, width: 4)

graph.addEdge(vertex: 0, width: 3)
graph.addEdge(vertex: 0, width: 2)
graph.addEdge(vertex: 3, width: 4)
graph.addEdge(vertex: 1, width: 0)
graph.addEdge(vertex: 2, width: 1)

graph.printEdges()

for index in 0...MAX {
    graph.getMotherVertices(start: index)
}
