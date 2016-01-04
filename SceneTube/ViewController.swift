//
//  ViewController.swift
//  SceneTube
//
//  Created by Lawrence F MacFadyen on 2015-08-10.
//  Copyright (c) 2015 LawrenceM. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupNodes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupScene()
    {
        let scnView = self.view as! SCNView
        let scene = LinkScene()
        
        scnView.scene = scene
        
        scnView.backgroundColor = UIColor.blackColor()
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "sceneTapped:")
        var gestureRecognizers = [UIGestureRecognizer]()

        gestureRecognizers.append(tapGesture)
        if let arr = scnView.gestureRecognizers { gestureRecognizers.appendContentsOf(arr) }
        scnView.gestureRecognizers = gestureRecognizers

    }
    
    func sceneTapped(recognizer: UITapGestureRecognizer) {
        let scnView = self.view as! SCNView
        let location = recognizer.locationInView(scnView)
        let hits = scnView.hitTest(location, options: nil)
        if let tappedNode = hits.first?.node {
            print("Node selected: \(tappedNode.name)")
        }
    }
    
    func setupNodes() {
        let node = Node(key:"Fiber-1")
        let childA = Node(key: "OCH-1")
        let childB = Node(key: "OCH-2")
        let childA1 = Node(key: "ODU4-1-1")
        let childA2 = Node(key: "ODU4-1-2")
        let childB1 = Node(key: "ODU4-2-1")
        let childC1 = Node(key: "ETY-10G-1-1-1")
        let childC2 = Node(key: "ETY-10G-1-1-2")
        let childC3 = Node(key: "ETY-10G-1-1-3")
        let childC4 = Node(key: "ETY-10G-1-2-1")
        let childC5 = Node(key: "ETY-10G-1-2-2")
        let childC6 = Node(key: "ETY-10G-2-1-1")
        
        node.addNode(childA)
        childA.addNode(childA1)
        childA.addNode(childA2)
        childA1.addNode(childC1)
        childA1.addNode(childC2)
        childA1.addNode(childC3)
        childA2.addNode(childC4)
        childA2.addNode(childC5)
        node.addNode(childB)
        childB.addNode(childB1)
        childB1.addNode(childC6)
        
        Node.traverse(node)
        
        if let found = Node.find("ETY-10G-1-2-2", node: node) {
            print("Found node: \(found.key)")
        }
        else
        {
            print("Did not find node")
        }


    }
}

