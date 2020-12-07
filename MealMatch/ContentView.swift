//
//  ContentView.swift
//  MealMatch
//
//  Created by Austin Dumm on 12/4/20.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct ContentView: View {
    
    @State private var matchService = MatchService();
    
    init() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor(hex: "#4a919e00")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "f5f5f5").edgesIgnoringSafeArea(.all)
                SessionStartView(connectionsLabel: "Connected devices:  ")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Meal Match")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SwipeObserver())
    }
}
