//
//  SwiftUIView.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 1/6/24.
//
import SwiftUI

struct EditProfileView: View {
    @Binding var contactInfo: String
    @Binding var bio: String
    @Binding var backgroundImageName: String
    @Binding var selectedBackgroundImage: UIImage?
    @Binding var profileImageName: String
    @Binding var selectedProfileImage: UIImage?

    @State private var isShowingImagePicker = false
    @State private var isSelectingProfileImage = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Editar perfil")
                .font(.largeTitle)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Datos:")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    TextField("Datos y metodo de contato", text: $contactInfo)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                
                Text("Descripción:")
                    .font(.headline)
                    .padding(.bottom, 5)

                HStack {
                    Image(systemName: "text.alignleft")
                        .foregroundColor(.gray)
                    TextField("Descripción", text: $bio)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Text("Imágenes:")
                    .font(.headline)
                    .padding(.bottom, 10)

                Button(action: {
                    isSelectingProfileImage = false
                    isShowingImagePicker = true
                }) {
                    HStack {
                        Image(systemName: "photo.fill")
                        Text("Seleccione Imagen de Fondo")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.init(hex: "6A5A8D"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.bottom, 10)

                Button(action: {
                    isSelectingProfileImage = true
                    isShowingImagePicker = true
                }) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Seleccione Foto de Perfil")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.init(hex: "6A5A8D"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(isPresented: $isShowingImagePicker, selectedImage: isSelectingProfileImage ? $selectedProfileImage : $selectedBackgroundImage)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    @State static var contactInfo = "Representante: Francisco Mendoza \nEmail: support@theaterproductions.com"
    @State static var bio = "Theater Productions Ltd. es una empresa líder en la producción de espectáculos teatrales inclusivos. Comprometidos con la accesibilidad, ofrecemos experiencias teatrales de alta calidad para todos los públicos. Contáctenos para disfrutar del mejor teatro accesible."
    @State static var backgroundImageName = "userBackground"
    @State static var selectedBackgroundImage: UIImage?
    @State static var profileImageName = "user19"
    @State static var selectedProfileImage: UIImage?

    static var previews: some View {
        EditProfileView(contactInfo: $contactInfo, bio: $bio, backgroundImageName: $backgroundImageName, selectedBackgroundImage: $selectedBackgroundImage, profileImageName: $profileImageName, selectedProfileImage: $selectedProfileImage)
    }
}
