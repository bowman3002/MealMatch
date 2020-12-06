//
//  SessionStartView.swift
//  MealMatch
//
//  Created by Kaylin Zaroukian on 12/5/20.
//

import SwiftUI

struct SessionStartView: View {
    @State var connectionsLabel: String
    let matchService = MatchService()

    var body: some View {
        VStack {
            Text(self.connectionsLabel)
                .fontWeight(.bold)
                .foregroundColor(.black)
            NavigationView {
                NavigationLink(destination: SwipableCardStack()) {
                    HStack {
                        Text("Start Meal Matching")
                            .fontWeight(.semibold)
                            .font(.title)
                        
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                .padding(.horizontal, 20)
            }
        }
    }
}



struct SessionStartView_Previews: PreviewProvider {
    static var previews: some View {
        SessionStartView(connectionsLabel: "Connected devices:  ")
    }
}

extension SessionStartView : MatchServiceDelegate {
    
    func connectedDevicesChanged(manager: MatchService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel = "Connected devices: \(connectedDevices)"
        }
    }

    func matchDetected(manager: MatchService, matchString: String) {
        OperationQueue.main.addOperation {
            switch matchString {
            case "right":
//                self.change(color: .red)
                NSLog("%@", "right")
            case "left":
//                self.change(color: .yellow)
                NSLog("%@", "Left")
            default:
                NSLog("%@", "Unknown color value received: \(matchString)")
            }
        }
    }
}

