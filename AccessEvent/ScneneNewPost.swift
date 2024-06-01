//
//  ScneneNewPost.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 31/5/24.
//

import SwiftUI
import UIKit

struct NewPostView: View {
    @Binding var isPresented: Bool
    @State private var eventname: String = ""
    @State private var description: String = ""
    @State private var location: String = ""
    @State private var standar: String = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented: Bool = false

    var onSubmit: (Post) -> Void

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Nuevo Post")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.init(hex: "43306C"))
                    .padding()

                TextField("Nombre del Evento", text: $eventname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Descripción", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Dirección", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    isImagePickerPresented = true
                }) {
                    HStack {
                        Text(selectedImage == nil ? "Seleccionar Imagen" : "Cambiar Imagen")
                        Spacer()
                        Image(systemName: "photo")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                }
                .padding()
                
                TextField("Estandar", text: $standar)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200)
                        .cornerRadius(10)
                        .padding()
                }

                Button(action: {
                    guard let selectedImage = selectedImage else {
                        return
                    }

                    // Save the image and create a new Post
                    if let imageName = saveImage(image: selectedImage) {
                        let newPost = Post(username: "You", userimage: "user19", location: location, eventname: eventname, description: description, imageName: imageName,standar: standar, likes: 0, isLiked: false)
                        onSubmit(newPost)
                        isPresented = false
                    }
                }) {
                    Text("Crear el Post")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.init(hex: "6A5A8D"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(eventname.isEmpty || description.isEmpty || location.isEmpty)
                .opacity(eventname.isEmpty || description.isEmpty || location.isEmpty ? 0.5 : 1)

                Spacer()
            }
            .navigationBarTitle("Nuevo Post", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                isPresented = false
            })
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(isPresented: $isImagePickerPresented, selectedImage: $selectedImage)
            }
        }
    }

    private func saveImage(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to JPEG data.")
            return nil
        }

        let filename = UUID().uuidString + ".jpg"
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
        do {
            try data.write(to: fileURL)
            return filename
        } catch {
            print("Failed to save image to \(fileURL): \(error.localizedDescription)")
            return nil
        }
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}


struct NewPostView_Previews: PreviewProvider {
    @State static var isPresented = true

    static var previews: some View {
        NewPostView(isPresented: $isPresented, onSubmit: { post in
            print(post)
        })
    }
}


