//
//  comment.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 30/5/24.
//

import Foundation

struct Comment: Identifiable, Decodable {
    var id = UUID()
    var username: String
    var text: String
    var userImage: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case text
        case userImage
    }
}

func loadComments(from filename: String) -> [Comment] {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let comments = try? JSONDecoder().decode([Comment].self, from: data) else {
        return []
    }
    return comments
}
