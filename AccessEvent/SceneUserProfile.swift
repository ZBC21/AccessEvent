//
//  SceneUserProfile.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 27/5/24.
//

import SwiftUI

struct UserProfile: View {
    @EnvironmentObject var userSession: UserSession
    
    @State private var posts: [Post] = [
        Post(username: "EventosMadrid", userImage: "user1",location: "Pl. de Isabel II, s/n, Centro, 28013 Madrid, España", eventName: "Concierto entretenido", description: "Disponible parar todo tipo de discapacidades, Click en mi usuario para comprar entradas.", imageName: "post1",likes: 0, isLiked: false),
        Post(username: "ConciertosAccesibles", userImage: "user1", location: "C. de Jovellanos, 4, Centro, 28014 Madrid", eventName: "Evento Accesible", description: "Quieres escuchar musica de calidad en un lugar listo y preparado para ti?!  A que esperas click en mi usuario", imageName: "post2",likes: 0, isLiked: false),
        Post(username: "MadridOrganiza", userImage: "user1", location: "Corre. Baja de San Pablo, 15, Centro, 28004 Madrid", eventName: "Evento Escucha bien", description: "Descripción del evento más imagenes del evento ", imageName: "post3",likes: 0, isLiked: false),
    ]

    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                Image("user1") // Replace with the actual user image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .background(RoundedRectangle(cornerRadius: 10)
                        .overlay(Image("userBackground").resizable())
                        .frame(width: 660, height: 170))
                    .padding(.vertical)
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            // User Information
                            Text("\(userSession.username)")
                                .font(.title)
                                .bold()
                            Text("Datos:") // Add actual data
                            Text("Descripción: alot of text will have to go there you know that rightt on that case what are we gonna do? so if this is too long what happens? will se i guess") // Add actual description
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.1))
                            .frame(minWidth: 500))
                    }
                    
                    // Posts
                    VStack {
                        ForEach(posts) { post in
                            PostView(post: post)
                                .padding(.bottom, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                )
                        }
                    }
                }
                .padding()
            }
        }
    }

struct UserProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        UserProfile()
            .environmentObject(UserSession())
    }
}


