//
//  SceneUserProfile.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 27/5/24.
//

import SwiftUI

struct UserProfile: View {
    @EnvironmentObject var userSession: UserSession
    @State private var posts: [Post] = []
    @State private var isShowingNewPostView = false
    @State private var isShowingEditView = false
    @State private var contactInfo: String = "Ejemplo de datos de contacto: \nRepresentante: Francisco Mendoza \nEmail: support@theaterproductions.com"
    @State private var bio: String = "Ejeplo de descipción: \nTheater Productions Ltd. es una empresa líder en la producción de espectáculos teatrales inclusivos. Comprometidos con la accesibilidad, ofrecemos experiencias teatrales de alta calidad para todos los públicos. Contáctenos para disfrutar del mejor teatro accesible."
    @State private var backgroundImageName: String = "userBackground"
    @State private var selectedBackgroundImage: UIImage?
    @State private var selectedProfileImage: UIImage?
    @State var profileImageName: String = "user19"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottom) {
                    if let selectedBackgroundImage = selectedBackgroundImage {
                        Image(uiImage: selectedBackgroundImage)
                            .resizable()
                            .frame(height: 250)
                            .ignoresSafeArea()
                    } else {
                        Image(backgroundImageName)
                            .resizable()
                            .frame(height: 250)
                            .ignoresSafeArea()
                    }
                    
                    VStack {
                        if let selectedProfileImage = selectedProfileImage {
                            Image(uiImage: selectedProfileImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        } else {
                            Image(profileImageName)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.bottom, -40)
                    .padding(.horizontal, -190)
                }
                .padding(.bottom, 50)

                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(userSession.fullName)
                                .font(.title)
                                .bold()
                            
                            Spacer()
                            
                            Button(action: {
                                isShowingEditView = true
                            }) {
                                Image(systemName: "square.and.pencil.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.init(hex: "43306C"))
                            }
                            .sheet(isPresented: $isShowingEditView) {
                                EditProfileView(contactInfo: $contactInfo, bio: $bio, backgroundImageName: $backgroundImageName, selectedBackgroundImage: $selectedBackgroundImage, profileImageName: $profileImageName, selectedProfileImage: $selectedProfileImage)
                            }
                            
                            Button(action: {
                                isShowingNewPostView = true
                            }) {
                                Image(systemName: "plus.square.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.init(hex: "43306C"))
                            }
                            .sheet(isPresented: $isShowingNewPostView) {
                                NewPostView(isPresented: $isShowingNewPostView) { newPost in
                                    posts.append(newPost)
                                }
                            }
                        }
                        Text("Datos:")
                            .bold()
                        Text(contactInfo)
                        Text("Descripción:")
                            .bold()
                        Text(bio)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(minWidth: 500))
                }
                VStack {
                    ForEach(posts) { post in
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

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(profileImageName: "user19")
            .environmentObject(UserSession())
    }
}

