//
//  AccessEventApp.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 21/5/24.
//

import SwiftUI

@main
struct AccessEventApp: App {
    @StateObject private var userSession = UserSession()
    @State private var isLoading = true // Add a state to control loading screen
    
    var body: some Scene {
        WindowGroup {
            if isLoading {
                // Show loading screen
                LoadingView(isLoading: $isLoading)
                    .onAppear {
                        // Simulate loading time, you can replace this with your actual setup tasks
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false // Set isLoading to false when setup is complete
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(userSession)
            }
        }
    }
}

struct LoadingView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack {
            Color.init(hex: "968DA9").ignoresSafeArea() // Set the background color for the entire view
            Circle()
                .fill(Color.white) // Set the fill color to the specified color
                .frame(width: 800, height: 800) // Set the size of the circle
                .offset(x: 0, y: -290) // Adjust the offset to move the circle
        
            VStack {
                Image("logoF")
                    .resizable()
                    .frame(width: 200, height: 190)
                    .padding(.bottom, 20)
                Text("Cargando...")
                    .font(.title)
                    .padding(.bottom, 20)
                
                ProgressView() // Use ProgressView for a built-in loading indicator
                    .progressViewStyle(CustomCircularProgressViewStyle())
                    
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(2.0) // Adjust the scale to make the loading indicator bigger
    }
}

