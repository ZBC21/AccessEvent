//
//  Post.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 21/5/24.
//

import SwiftUI

struct Post: Identifiable, Decodable {
    let id = UUID() // Identificador único para cada post
    var username: String
    var userImage: String
    var location: String
    var eventName: String
    var description: String
    var imageName: String
    var likes: Int
    var isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case username
        case userImage
        case location
        case eventName
        case description
        case imageName
        case likes
        case isLiked
    }
}


func loadPosts(from filename: String) -> [Post] {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return []
    }
    do {
        let data = try Data(contentsOf: url)
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    } catch {
        return []
    }
}

