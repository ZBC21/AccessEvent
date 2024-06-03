//
//  UserSession.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 28/5/24.
//

import Foundation
import Combine

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: RegistrationData?

    var fullName: String {
        guard let user = currentUser else {
            return "John Lee"
        }
        return "\(user.name) \(user.lastName)"
    }

    private let usersFileName = "users.json"

    func login(username: String, password: String) -> Bool {
        if let users = loadUsers(), let user = users.first(where: { $0.username == username && $0.password == password }) {
            currentUser = user
            isLoggedIn = true
            printAllUsers() // Print users after successful login
            return true
        }
        return false
    }

    func printAllUsers() {
        if let users = loadUsers() {
            for user in users {
                print("Username: \(user.username), Password: \(user.password)")
            }
        } else {
            print("No users found.")
        }
    }
    
    func reloadUsers() {
        if let users = loadUsers() {
            print("Users reloaded:")
            for user in users {
                print("Username: \(user.username), Password: \(user.password)")
            }
        } else {
            print("No users found.")
        }
    }

    private func loadUsers() -> [RegistrationData]? {
        guard let url = getDocumentsDirectory()?.appendingPathComponent(usersFileName) else {
            print("Error: No se pudo obtener el directorio de documentos.")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            
            // Debugging: Print the contents of the JSON file
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON file contents: \(jsonString)")
            }
            
            let decoder = JSONDecoder()
            let users = try decoder.decode([RegistrationData].self, from: data)
            return users
        } catch {
            print("Error al cargar los usuarios: \(error.localizedDescription)")
            return nil
        }
    }

    private func getDocumentsDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}



