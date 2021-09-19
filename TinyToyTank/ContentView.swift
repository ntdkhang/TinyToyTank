//
//  ContentView.swift
//  TinyToyTank
//
//  Created by Nguyen Tran Duy Khang on 9/19/21.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
//    @State var tankAnchor: TinyToyTank._TinyToyTank?
    @State var action: String?
    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ControlButtonView()
            }
        }
    }
}

struct ControlButtonView: View {
    var body: some View {
        HStack {
            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.tankLeft.post()
                    ARViewController.shared.isActionPlaying = true
                }
                
            }, label: {
                Image(uiImage: UIImage(named: "TankLeft")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })
            
            
            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.tankRight.post()
                    ARViewController.shared.isActionPlaying = true
                }

            }, label: {
                Image(uiImage: UIImage(named: "TankRight")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })

            
            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.tankForward.post()
                    ARViewController.shared.isActionPlaying = true
                }

            }, label: {
                Image(uiImage: UIImage(named: "TankForward")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })

            
            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.turretLeft.post()
                    ARViewController.shared.isActionPlaying = true
                }

            }, label: {
                Image(uiImage: UIImage(named: "TurretLeft")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })

            
            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.turretRight.post()
                    ARViewController.shared.isActionPlaying = true
                }

            }, label: {
                Image(uiImage: UIImage(named: "TurretRight")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })
            

            Button(action: {
                if !ARViewController.shared.isActionPlaying {
                    ARViewController.shared.tankAnchor!.notifications.cannonFire.post()
                    ARViewController.shared.isActionPlaying = true
                }

            }, label: {
                Image(uiImage: UIImage(named: "CannonFire")!)
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
            })
            
        }
    }
    
    var buttonSize: CGFloat = 50
}

struct ARViewContainer: UIViewRepresentable {
  
    func makeUIView(context: Context) -> ARView {
    
//        let arView = ARView(frame: .zero)
        
//        var tankAnchor: TinyToyTank._TinyToyTank?
//        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        
        // Add the tank anchor to the scene
//        arView.scene.anchors.append(tankAnchor!)
//        return arView
        
        return ARViewController.shared.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
