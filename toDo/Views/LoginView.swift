//
//  LoginView.swift
//  toDo
//
//  Created by Atakan Toprakbasti on 3/7/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink)
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage).foregroundColor(Color.red)
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TLButton(title: "Log In", background: .blue) {
                            viewModel.login()
                        }
                        .padding()

                    }
                .offset(y: -50)
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
