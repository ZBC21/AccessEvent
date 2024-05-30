//
//  Registration.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 29/5/24.
//

import SwiftUI

enum RegistrationStep: Int, CaseIterable {
    case name
    case age
    case email
    case address
    case cif
}

struct RegistrationData {
    var name: String = ""
    var surname: String = ""
    //date of birh
    var age: String = ""
    var email: String = ""
    var address: String = ""
    var cif: String = ""
}
