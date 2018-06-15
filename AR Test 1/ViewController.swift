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
    
    let kStartingPosition = SCNVector3(0, 0, -0.6)
    let kAnimationDurationMoving: TimeInterval = 0.2
    let kMovingLengthPerLoop: CGFloat = 0.05
    let kRotationRadianPerLoop: CGFloat = 0.2
    
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
    
    @IBAction func upLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.moveBy(x: 0, y: kMovingLengthPerLoop, z: 0, duration: kAnimationDurationMoving)
        execute(action: action, sender: sender)
    }
    
    private func execute(action: SCNAction, sender: UILongPressGestureRecognizer) {
        let loopAction = SCNAction.repeatForever(action)
        if sender.state == .began {
            chair.runAction(loopAction)
        } else if sender.state == .ended {
            chair.removeAllActions()
        }
    }
    
    
}

