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
        let gestureRecognizers = NSMutableArray()
        gestureRecognizers.addObject(tapGesture)
        if let arr = scnView.gestureRecognizers { gestureRecognizers.addObjectsFromArray(arr) }
        scnView.gestureRecognizers = gestureRecognizers as [AnyObject]

    }
    
    func sceneTapped(recognizer: UITapGestureRecognizer) {
        let scnView = self.view as! SCNView
        let location = recognizer.locationInView(scnView)
        let hits = scnView.hitTest(location, options: nil)
        if let tappedNode = hits?.first?.node {
            println("Node selected: \(tappedNode.name)")
        }
    }
}

