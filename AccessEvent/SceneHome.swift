//
//  SceneHome.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI

struct SceneHome: View {
        
        @State private var posts: [Post] = [
            Post(username: "EventosMadrid", userimage: "user1",location: "Pl. de Isabel II, s/n, Centro, 28013 Madrid, España", eventName: "Concierto entretenido", description: "Disponible parar todo tipo de discapacidades, Click en mi usuario para comprar entradas.", imageName: "post1",likes: 10, isLiked: false),
            Post(username: "ConciertosAccesibles", userimage: "user2", location: "C. de Jovellanos, 4, Centro, 28014 Madrid", eventName: "Evento Accesible", description: "Quieres escuchar musica de calidad en un lugar listo y preparado para ti?!  A que esperas click en mi usuario", imageName: "post2",likes: 9, isLiked: false),
            Post(username: "MadridOrganiza", userimage: "user3", location: "Corre. Baja de San Pablo, 15, Centro, 28004 Madrid", eventName: "Evento Escucha bien", description: "Descripción del evento más imagenes del evento ", imageName: "post3",likes: 5, isLiked: false),
        ]
        
        @State private var selectedLocation: String = "Comunidad de Madrid"
        
        let comunidadesAutonomas = [
            "Andalucía", "Aragón", "Canarias", "Cantabria", "Castilla-La Mancha", "Castilla y León", "Cataluña",
            "Ceuta", "Comunidad de Madrid", "Comunidad Valenciana", "Extremadura", "Galicia", "Islas Baleares",
            "La Rioja", "Melilla", "Navarra y País Vasco", "Región de Murcia"
        ].sorted()
        
        var body: some View {
        NavigationView(content: {
            VStack {
                HStack {
                    Menu {
                        ForEach(comunidadesAutonomas, id: \.self) { comunidad in
                            Button(action: {
                                selectedLocation = comunidad
                            }) {
                                Text(comunidad)
                            }
                        }
                    } label: {
                        Text(selectedLocation)
                            .font(.title)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding()
                    HStack {
                            NavigationLink(destination: QuienesSomosView()) {
                                Text("¿Quienes Somos?")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            Spacer(minLength: 25)
                            NavigationLink(destination: FAQView()) {
                                Text("FAQ")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        ForEach(posts) { post in
                            PostView(post: post)
                                .padding(.bottom, 10)
                        }.background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                .shadow(radius: 2,x: 1, y: 2)
                        ).padding(.bottom, 10)
                    }
                    .padding()
                }
            }
        })
        }
}

#Preview {
    SceneHome()
}
