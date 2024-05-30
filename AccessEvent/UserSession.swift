//
//  UserSession.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 28/5/24.
//

import SwiftUI

import Combine

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    var username: String = "John Doe"
    
}
