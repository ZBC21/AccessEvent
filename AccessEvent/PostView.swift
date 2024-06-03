//
//  PostView.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 21/5/24.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State private var showingCommentInput = false
    @State private var commentText = ""
    @State private var isSharing = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // User Image and Name
            HStack {
                Image(post.userimage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.location)
                        .font(.subheadline)
                }
            }

            // Event Name
            Text(post.eventname)
                .font(.title2)
                .fontWeight(.bold)

            // Description
            Text(post.description)
                .font(.body)

            // Image
            if let uiImage = loadImage(named: post.imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
            } else {
                Text("Image not available")
            }

            Text(post.standar)
                .font(.body)
                .bold()
                .multilineTextAlignment(.center)

            // Action Buttons
            HStack {
                Button(action: {
                    toggleLike()
                }) {
                    HStack {
                        Image(systemName: post.isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        Text("Like (\(post.likes))")
                    }
                }
                Spacer()
                Button(action: {
                    showingCommentInput.toggle()
                }) {
                    HStack {
                        Image(systemName: "bubble.left")
                        Text("Comment")
                    }
                }
                Spacer()
                Button(action: {
                    isSharing.toggle()
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                }
                .sheet(isPresented: $isSharing) {
                    ShareSheet(items: ["Check out this event: \(post.eventname)\n\(post.description)"])
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .sheet(isPresented: $showingCommentInput) {
            CommentInputView(commentText: $commentText)
        }
    }

    func toggleLike() {
        // Toggle the like state and update the number of likes
        post.isLiked.toggle()
        post.likes += post.isLiked ? 1 : -1
    }

    private func loadImage(named imageName: String) -> UIImage? {
        // First check if the image is in the Assets catalog
        if let assetImage = UIImage(named: imageName) {
            return assetImage
        }

        // If not found in Assets, try to load from the Documents directory
        let fileURL = getDocumentsDirectory().appendingPathComponent(imageName)
        return UIImage(contentsOfFile: fileURL.path)
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

struct CommentInputView: View {
    @Binding var commentText: String
    @State private var comments: [Comment] = []
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack {
                List(comments) { comment in
                    HStack(alignment: .top, spacing: 10) {
                        Image(comment.userImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(comment.username)
                                .font(.headline)
                            Text(comment.text)
                                .font(.body)
                        }
                    }
                    .padding(.vertical, 5)
                }
                
                Spacer()
                
                if isLoggedIn {
                    TextField("Write a comment...", text: $commentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: submitComment) {
                        Text("Submit")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                    .padding()
                } else {
                    VStack {
                        Text("Porfavor verifique se o inicie Session")
                            .padding()
                        Button(action: login) {
                            Text("Iniciar Sessión")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                        .padding()
                        Button(action: verifyUsingCamera) {
                            Text("Escanea para Comentar")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.init(hex:"43306C"))
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Comments", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                dismissView()
            })
            .onAppear {
                comments = loadComments(from: "Comments")
            }
        }
    }

    private func submitComment() {
        let newComment = Comment(username: "You", text: commentText, userImage: "user1")
        comments.append(newComment)
        commentText = ""
    }

    private func login() {
        isLoggedIn = true
    }

    private func verifyUsingCamera() {
        isLoggedIn = true
    }

    private func dismissView() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            scene.windows.first { $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

//struct PostView_Previews: PreviewProvider {
   // static var previews: some View {
  //      PostView()
   // }
//}
