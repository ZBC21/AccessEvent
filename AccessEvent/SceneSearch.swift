//
//  SceneSearch.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI

struct SceneSearch: View {
    @State private var posts: [Post] = [
        Post(username: "EventosMadrid", userimage: "user1",location: "Pl. de Isabel II, s/n, Centro, 28013 Madrid, España", eventName: "Concierto entretenido", description: "Disponible parar todo tipo de discapacidades, Click en mi usuario para comprar entradas.", imageName: "post1",likes: 0, isLiked: false),
        Post(username: "ConciertosAccesibles", userimage: "user1", location: "C. de Jovellanos, 4, Centro, 28014 Madrid", eventName: "Evento Accesible", description: "Quieres escuchar musica de calidad en un lugar listo y preparado para ti?!  A que esperas click en mi usuario", imageName: "post2",likes: 0, isLiked: false),
        Post(username: "MadridOrganiza", userimage: "user1", location: "Corre. Baja de San Pablo, 15, Centro, 28004 Madrid", eventName: "Evento Escucha bien", description: "Descripción del evento más imagenes del evento ", imageName: "post3",likes: 0, isLiked: false),
    ]
    
    @State private var selectedLocation: String = "Comunidad de Madrid"
    
    let comunidadesAutonomas = [
        "Andalucía", "Aragón", "Canarias", "Cantabria", "Castilla-La Mancha", "Castilla y León", "Cataluña",
        "Ceuta", "Comunidad de Madrid", "Comunidad Valenciana", "Extremadura", "Galicia", "Islas Baleares",
        "La Rioja", "Melilla", "Navarra y País Vasco", "Región de Murcia"
    ].sorted()
    
    @State private var searchText = ""
    
    @State private var selectedTags = Set<String>() // Set to store selected tags
    let tags = ["Teatro", "Clasico", "Muletas", "Danza", "Musica"]
    
    var body: some View {
        VStack {
            Text("Busqueda")
                .font(.largeTitle)
            HStack {
                TextField("Search...", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                Button("Search") {
                    // Perform search action with searchText
                    print("Searching for: \(searchText)") // Replace with actual search logic
                }
            }
            .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(tags, id: \.self) { tag in
                        TagView(text: tag, isSelected: selectedTags.contains(tag)) {
                            // Handle tag selection/deselection
                            if selectedTags.contains(tag) {
                                selectedTags.remove(tag) // Deselect tag if already selected
                            } else {
                                selectedTags.insert(tag) // Select the current tag
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            ScrollView {
                // no se si dejarlo...
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
        
    }
}

struct TagView: View {

    let text: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Text(text)
            .padding(8)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    SceneSearch()
}
