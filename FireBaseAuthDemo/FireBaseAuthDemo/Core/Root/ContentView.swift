//
//  ContentView.swift
//  FireBaseAuthDemo
//
//  Created by Shivansh Singh on 29/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}


#Preview {
    ContentView()
}
