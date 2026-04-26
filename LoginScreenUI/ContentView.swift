//
//  ContentView.swift
//  LoginScreenUI
//
//  Created by Nur on 26/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedin: Bool = false
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    var body: some View {
        NavigationView{
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(2.2)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(0.7).foregroundColor(.white.opacity(0.15))
                VStack {
                    Text("Login")
                        .bold()
                        .font(.largeTitle)
                        .colorInvert()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.white
                            .opacity(0.8))
                        .cornerRadius(12)
                        .border(.red.opacity(0.8), width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 320, height: 50)
                        .background(Color.white
                            .opacity(0.8))
                        .cornerRadius(12)
                        .border(.red.opacity(0.8), width: CGFloat(wrongPassword))
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .bold()
                        .foregroundColor(.blue)
                        .frame(width: 320, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $isLoggedin){
                        EmptyView()
                    }
                    
                    
                }
            }
        }.navigationBarHidden(true)
    }
    
    func authenticateUser(username: String, password: String,){
        if username.lowercased() == "hello" {
            wrongUsername = 0
            if password.lowercased() == "11223344"{
                wrongPassword = 0
                isLoggedin = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongPassword = 2
        }
    }
}

#Preview {
    ContentView()
}
