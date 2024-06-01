//
//  Post.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 21/5/24.
//

import SwiftUI
import UIKit

struct Post: Identifiable, Decodable {
    let id = UUID() // Identificador único para cada post
    var username: String
    var userimage: String
    var location: String
    var eventname: String
    var description: String
    var imageName: String
    var standar: String
    var likes: Int
    var isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case username
        case userimage
        case location
        case eventname
        case description
        case imageName
        case standar
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

func loadImage(named imageName: String) -> UIImage? {
    let fileURL = getDocumentsDirectory().appendingPathComponent(imageName)
    return UIImage(contentsOfFile: fileURL.path)
}

func getDocumentsDirectory() -> URL {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

