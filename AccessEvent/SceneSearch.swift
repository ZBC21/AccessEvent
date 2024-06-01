//
//  SceneSearch.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI

struct SceneSearch: View {
    @State private var posts: [Post] = []
    @State private var selectedLocation: String = "Comunidad de Madrid"
    
    let comunidadesAutonomas = [
        "Andalucía", "Aragón", "Canarias", "Cantabria", "Castilla-La Mancha", "Castilla y León", "Cataluña",
        "Ceuta", "Comunidad de Madrid", "Comunidad Valenciana", "Extremadura", "Galicia", "Islas Baleares",
        "La Rioja", "Melilla", "Navarra y País Vasco", "Región de Murcia"
    ].sorted()
    
    @State private var searchText = ""
    @State private var selectedTags = Set<String>() // Set to store selected tags
    let tags = ["Teatro", "Yoga", "Tier 1", "Danza", "Musica"]
    
    // Computed property to filter posts based on search text
    var filteredPosts: [Post] {
        if searchText.isEmpty {
            return posts
        } else {
            return posts.filter {
                $0.eventname.lowercased().contains(searchText.lowercased()) ||
                $0.standar.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Busqueda")
                .font(.largeTitle)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
            HStack {
                TextField("Busqueda...", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button("Buscar") {
                    // Perform search action with searchText
                    print("Buscando en \(searchText)") // Replace with actual search logic
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(tags, id: \.self) { tag in
                        TagView(text: tag, isSelected: searchText.lowercased() == tag.lowercased()) {
                            searchText = tag
                        }
                    }
                }
            }
            .padding(.horizontal)
            
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
