//
//  SceneHome.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI

struct SceneHome: View {
    @State private var posts: [Post] = []
    @State private var filteredPosts: [Post] = []
    @State private var selectedLocation: String = "Comunidad de Madrid"
    
    let comunidadesAutonomas = [
        "Andalucía", "Aragón", "Canarias", "Cantabria", "Castilla-La Mancha", "Castilla y León", "Cataluña",
        "Ceuta", "Comunidad de Madrid", "Comunidad Valenciana", "Extremadura", "Galicia", "Islas Baleares",
        "La Rioja", "Melilla", "Navarra y País Vasco", "Región de Murcia"
    ].sorted()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Menu {
                        ForEach(comunidadesAutonomas, id: \.self) { comunidad in
                            Button(action: {
                                selectedLocation = comunidad
                                filterPosts(by: selectedLocation)
                            }) {
                                Text(comunidad)
                            }
                        }
                    } label: {
                        Text(selectedLocation)
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.init(hex: "43306C"))
                            .bold()
                    }
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        NavigationLink(destination: QuienesSomosView()) {
                            Text("¿Quienes Somos?")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "6A5A8D"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Spacer(minLength: 15)
                        NavigationLink(destination: FAQView()) {
                            Text("FAQ")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "6A5A8D"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .bold()
                        }
                        Spacer(minLength: 15)
                        NavigationLink(destination: AccessibilityStandardsView()) {
                            Text("Estándares de Accesibilidad")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.init(hex: "6A5A8D"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .bold()
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView {
                    VStack {
                        ForEach(filteredPosts) { post in
                            PostView(post: post)
                                .padding(.bottom, 10)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                .shadow(radius: 2, x: 1, y: 2)
                        )
                        .padding(.bottom, 10)
                    }
                    .padding()
                }
            }
            .onAppear {
                posts = loadPosts(from: "posts")
                filterPosts(by: selectedLocation)
            }
        }
    }
    
    private func filterPosts(by location: String) {
        filteredPosts = posts.filter { $0.location.contains(location) }
    }
}


#Preview {
    SceneHome()
}
