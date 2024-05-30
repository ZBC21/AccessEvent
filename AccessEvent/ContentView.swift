//
//  ContentView.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 21/5/24.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        //for log out purposes
        //Button("Logout") {
          //  userSession.isLoggedIn = false
        //}
        TabView {
            SceneHome()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SceneSearch()
                .tabItem {
                    Image(systemName: "sparkle.magnifyingglass")
                    Text("Busqueda")
                }

            if userSession.isLoggedIn {
                UserProfile()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("User")
                    }
                NotificationsViewControllerPreview()
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notificaciones")
                    }
                SettingsViewControllerPreview()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Ajustes")
                    }
            } else {
                SceneLogin()
                //"Usuario""Password"
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("User")
                    }
                
                VistaNoLog()
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notificaciones")
                    }
                
                VistaNoLog()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Ajustes")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSession())
    }
}



