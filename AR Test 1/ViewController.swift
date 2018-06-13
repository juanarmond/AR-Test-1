//
//  ViewController.swift
//  AR Test 1
//
//  Created by Juan Armond on 13/06/2018.
//  Copyright © 2018 Juan Armond. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let chair = Chair()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupConfiguration()
    }
    
    func setupScene() {
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    func setupConfiguration() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        addChair()
    }

    func addChair(){
        chair.loadModel()
        sceneView.scene.rootNode.addChildNode(chair)
    }
}

