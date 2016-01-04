//
//  LinkScene.swift
//  SceneTube
//
//  Created by Lawrence F MacFadyen on 2015-08-11.
//  Copyright (c) 2015 LawrenceM. All rights reserved.
//

import Foundation
import SceneKit

class LinkScene: SCNScene {
    
    override init() {
        super.init()
        
        let tubeGeometry = SCNTube(innerRadius: 0.9, outerRadius: 1.0, height: 2.5)
        let tubeNode = SCNNode(geometry: tubeGeometry)
        tubeNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        tubeNode.name = "LC-Blue"
        tubeGeometry.firstMaterial?.diffuse.contents = UIColor.blueColor()
        
        let tubeGeometry2 = SCNTube(innerRadius: 0.0, outerRadius: 0.9, height: 3.0)
        let tubeNode2 = SCNNode(geometry: tubeGeometry2)
        tubeNode2.position = SCNVector3(x: 0.0, y: 0.25, z: 0.0)
        tubeNode2.name = "LC-Green"
        tubeGeometry2.firstMaterial?.diffuse.contents = UIColor.greenColor()
        
        let tubeGeometry3 = SCNTube(innerRadius: 0.0, outerRadius: 0.4, height: 3.7)
        let tubeNode3 = SCNNode(geometry: tubeGeometry3)
        tubeNode3.position = SCNVector3(x: 0.42, y: 0.8, z: 0.0)
        tubeNode3.name = "LC-Red-1"
        tubeGeometry3.firstMaterial?.diffuse.contents = UIColor.redColor()
        
        let tubeGeometry4 = SCNTube(innerRadius: 0.0, outerRadius: 0.4, height: 3.7)
        let tubeNode4 = SCNNode(geometry: tubeGeometry4)
        tubeNode4.position = SCNVector3(x: -0.42, y: 0.8, z: 0.0)
        tubeNode4.name = "LC-Red-2"
        tubeGeometry4.firstMaterial?.diffuse.contents = UIColor.redColor()
        
        self.rootNode.addChildNode(tubeNode)
        self.rootNode.addChildNode(tubeNode2)
        self.rootNode.addChildNode(tubeNode3)
        self.rootNode.addChildNode(tubeNode4)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


