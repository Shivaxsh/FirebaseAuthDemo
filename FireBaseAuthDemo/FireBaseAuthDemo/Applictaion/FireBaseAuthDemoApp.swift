//
//  FireBaseAuthDemoApp.swift
//  FireBaseAuthDemo
//
//  Created by Shivansh Singh on 29/09/23.
//

import SwiftUI
import Firebase

@main
struct FireBaseAuthDemoApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
