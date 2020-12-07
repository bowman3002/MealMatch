//
//  MatchService.swift
//  MealMatch
//
//  Created by Kaylin Zaroukian on 12/6/20.
//

import Foundation

import MultipeerConnectivity

protocol MatchServiceDelegate {
    func connectedDevicesChanged(manager: MatchService, connectedDevices: [String])
    
    func matchDetected(manager: MatchService, matchString: String)

}

class MatchService : NSObject {
    private let Match = "right"
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvetiser : MCNearbyServiceAdvertiser
    private let serviceBrowser : MCNearbyServiceBrowser
    var delegate : MatchServiceDelegate?
    
    lazy var session : MCSession = {
        let session = MCSession(peer: self.myPeerId, securityIdentity: nil, encryptionPreference: .required)
        
        session.delegate = self
        return session
    }()
    
    override init() {
        self.serviceAdvetiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: Match)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: Match)
        
        super.init()
        
        self.serviceAdvetiser.delegate = self
        self.serviceAdvetiser.startAdvertisingPeer()
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
        
    }
    
    deinit {
        self.serviceAdvetiser.stopAdvertisingPeer()
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
    func send(restaurantName : String) {
        NSLog("%@", "Send Right Swipe: \(restaurantName) to \(session.connectedPeers.count) peers, \(session.connectedPeers.self)")
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(restaurantName.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            } catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }
    }
}

extension MatchService : MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error : Error) {
        NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didRecieveInvitationFromPeer \(peerID)")
        invitationHandler(true, self.session)
    }
}

extension MatchService : MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error : Error) {
        NSLog("%@", "didNotStartBrowsingForPeers: \(error)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
            NSLog("%@", "foundPeer: \(peerID)")
            NSLog("%@", "invitePeer: \(peerID)")
            browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
        }

        func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
            NSLog("%@", "lostPeer: \(peerID)")
        }
}

extension MatchService : MCSessionDelegate {

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        NSLog("%@", "peer \(peerID) didChangeState: \(state.rawValue)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
            session.connectedPeers.map{$0.displayName})
    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data)")
        let str = String(data: data, encoding: .utf8)!
        self.delegate?.matchDetected(manager: self, matchString: str)
    }

    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }
}
