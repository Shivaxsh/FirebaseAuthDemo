//
//  RegistrationView.swift
//  FireBaseAuthDemo
//
//  Created by Shivansh Singh on 29/09/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter Your Name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Your Password",
                          isSecureField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm Your Password",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 15)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname:fullname)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an Account?")
                    Text("Sign-In")
                        .fontWeight(.bold)
                }
                .font(.system(size: 15))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
