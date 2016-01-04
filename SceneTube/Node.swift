//
//  Node.swift
//  SceneTube
//
//  Created by Lawrence F MacFadyen on 2015-08-13.
//  Copyright (c) 2015 LawrenceM. All rights reserved.
//

import Foundation

public class Node <T: Comparable>{
    var key: T!
    var children: Array<Node>
    
    init(key: T) {
        self.key = key
        self.children = Array<Node>()
    }
    
    func addNode(node: Node) {
        children.append(node)
    }
    
    class func traverse(parentNode: Node) {
        for child in parentNode.children {
            print("Node: \(child.key)")
            traverse(child)
        }
    }
    
    class func find(key: T, node: Node) -> Node?{
        
        if(node.key==key) {
            print("Returning the node: \(node.key)")
            return node
        }
        else
        {
            for child in node.children {
                if let found = find(key, node: child)
                {
                    print("Found a node \(found.key)")
                    return found
                }
                
            }
        }
        return nil
    }
}
