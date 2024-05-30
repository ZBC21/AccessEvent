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

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // User Image and Name
            HStack {
                Image(post.userImage)
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
            Text(post.eventName)
                .font(.title2)
                .fontWeight(.bold)

            // Description
            Text(post.description)
                .font(.body)

            // Image
            Image(post.imageName)
                .resizable()
                .scaledToFit()

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
                    sharePost()
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
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

    func sharePost() {
        // Action to share the post (this is just a placeholder)
        print("Sharing post: \(post.eventName)")
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
                            Text("Verify Using Camera")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(username: "John Doe",userImage: "userimage" , location: "New York", eventName: "Sample Event", description: "This is a sample post description.", imageName: "sampleimage", likes: 0, isLiked: false))
    }
}
