//
//  Registration.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 29/5/24.
//

import Foundation
import SwiftUI

struct RegistrationData: Codable {
    var name: String = ""
    var lastName: String = ""
    var dateOfBirth: Date = Date()
    var email: String = ""
    var address: String = ""
    var cif: String = ""
    var username: String = ""
    var password: String = ""
}

enum RegistrationStep: Int, CaseIterable {
    case name = 0
    case usernamePassword
    case dateOfBirth
    case email
    case address
    case cif
}

func is18YearsOld(dateOfBirth: Date) -> Bool {
    let calendar = Calendar.current
    let now = Date()
    let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: now)
    guard let age = ageComponents.year else {
        return false
    }
    return age >= 18
}
