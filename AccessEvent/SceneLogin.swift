//
//  SceneLogin.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI

struct SceneLogin: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isLoading: Bool = false
    @State private var showingRegistrationView = false
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        VStack {
            if userSession.isLoggedIn {
                UserProfile()
            } else {
                ZStack {
                    Color.white.ignoresSafeArea() // Set the background color for the entire view
                    
                    Circle()
                        .fill(Color.init(hex: "968DA9")) // Set the fill color to the specified color
                        .frame(width: 550, height: 600) // Set the size of the circle
                        .offset(x: 0, y: -400) // Adjust the offset to move the circle
                    
                    VStack {
                        Image("logoF") // Add your image here
                            .resizable()
                            .frame(width: 150, height: 140)
                        Text("AccessEvent")
                            .font(.title)
                            .foregroundColor(Color.black)
                            .bold()
                    }
                    .offset(x: 0, y: -270)
                    
                    VStack {
                        Text("Iniciar Sesión")
                            .font(.largeTitle)
                            .padding()
                        
                        TextField("Nombre de usuario", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .frame(maxWidth: 390)
                            .accessibilityLabel("Nombre de usuario")
                            .font(.headline)
                            .bold()
                        
                        SecureField("Contraseña", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .frame(maxWidth: 390)
                            .accessibilityLabel("Contraseña")
                            .font(.headline)
                            .bold()
                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .bold()
                                .padding([.top, .bottom], 10)
                        }
                        
                        if isLoading {
                            ProgressView()
                                .padding()
                        }
                        
                        Button(action: login) {
                            Text("Iniciar Sesión")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .bold()
                        }
                        .padding()
                        .disabled(username.isEmpty || password.isEmpty)
                        .opacity(username.isEmpty || password.isEmpty ? 0.5 : 1)
                        
                        HStack {
                            Text("¿No tienes cuenta todavía?")
                                .foregroundColor(.black)
                            
                            Text("Regístrate")
                                .foregroundColor(.blue)
                                .underline()
                                .onTapGesture {
                                    showingRegistrationView.toggle()
                                }
                        }
                        .padding()
                    }
                    .padding()
                    .sheet(isPresented: $showingRegistrationView) {
                        RegistrationView()
                            .environmentObject(userSession)
                    }
                    .padding(.top, 180)
                }
            }
        }
    }
    
    func login() {
        errorMessage = ""
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            
            if userSession.login(username: username, password: password) {
                // Login successful
            } else {
                errorMessage = "Credenciales inválidas."
            }
        }
    }
}


#Preview {
    SceneLogin()
        .environmentObject(UserSession())
}
