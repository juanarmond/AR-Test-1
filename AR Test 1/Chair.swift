//
//  Chair.swift
//  AR Test 1
//
//  Created by Juan Armond on 13/06/2018.
//  Copyright © 2018 Juan Armond. All rights reserved.
//

import Foundation
import SceneKit

class Chair: SCNNode {
    func loadModel() {
        guard let virtualObjectScene = SCNScene(named: "Drone.scn") else { return }
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        addChildNode(wrapperNode)
    }
}
