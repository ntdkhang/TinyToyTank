//
//  ARViewController.swift
//  ARViewController
//
//  Created by Nguyen Tran Duy Khang on 9/19/21.
//

import Foundation
import RealityKit
import ARKit

class ARViewController: ObservableObject {
    static var shared = ARViewController()
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false
    
    
    @Published var arView: ARView
    
    init() {
        arView = ARView(frame: .zero)
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.cannon?.setParent(tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor?.actions.actionComplete.onAction = { _ in
            self.isActionPlaying = false
        }
        arView.scene.anchors.append(tankAnchor!)
    }
    
    public func startARSession() {
        startPlaneDetection()
        
//        startTapDetection()
    }
    
    private func startPlaneDetection() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
    }
    
    
}
