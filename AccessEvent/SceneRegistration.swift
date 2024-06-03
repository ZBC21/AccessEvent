//
//  SceneRegistration.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 28/5/24.
//

import SwiftUI

struct UsernamePasswordStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción Nombre de Usuario y Contraseña")
                .font(.title)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            
            TextField("Nombre de Usuario", text: $registrationData.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Contraseña", text: $registrationData.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordRegex.evaluate(with: password)
    }
}


struct NameStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción       Nombre y Apellido")
                .font(.title)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            TextField("Nombre", text: $registrationData.name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Apellido", text: $registrationData.lastName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

struct DateOfBirthStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción         Fecha de Nacimiento")
                .font(.title)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            DatePicker("Fecha de Nacimiento", selection: $registrationData.dateOfBirth, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}


struct EmailStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción                   el Correo Electronico")
                .font(.title)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            TextField("Correo Electrónico", text: $registrationData.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

struct AddressStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción Dirección")
                .font(.title)
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            TextField("Dirección", text: $registrationData.address)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

struct CIFStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            Text("Introducción CIF o Número de Identificación de la Empresa")
                .foregroundColor(Color.init(hex: "43306C"))
                .bold()
                .padding()
            TextField("CIF ", text: $registrationData.cif)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !warningMessage.isEmpty {
                Text(warningMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

import SwiftUI

struct RegistrationView: View {
    @State private var currentStep: RegistrationStep = .name
    @State private var registrationData = RegistrationData()
    @State private var warningMessage: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userSession: UserSession
    
    private let usersFileName = "users.json"
    
    var body: some View {
        VStack {
            ProgressView(value: Double(currentStep.rawValue) / Double(RegistrationStep.allCases.count - 1))
                .padding()
                
            Spacer()
            
            switch currentStep {
            case .name:
                NameStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .usernamePassword:
                UsernamePasswordStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .dateOfBirth:
                DateOfBirthStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .email:
                EmailStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .address:
                AddressStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .cif:
                CIFStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            }
            
            Spacer()
            
            HStack {
                if currentStep != .name {
                    Button(action: {
                        previousStep()
                    }) {
                        Text("Anterior")
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    nextStep()
                }) {
                    Text(currentStep == .cif ? "Finalizar" : "Siguiente")
                        .padding()
                        .background(Color.init(hex: "6A5A8D"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            createUsersFileIfNeeded()
        }
    }
    
    private func nextStep() {
        switch currentStep {
        case .name:
            if registrationData.name.isEmpty || registrationData.lastName.isEmpty {
                warningMessage = "Por favor, ingrese su nombre y apellido."
            } else {
                warningMessage = ""
                currentStep = .usernamePassword
            }
        case .usernamePassword:
            if registrationData.username.isEmpty {
                warningMessage = "Por favor, ingrese un nombre de usuario."
            } else if !isValidPassword(registrationData.password) {
                warningMessage = "La contraseña debe tener al menos 8 caracteres, incluyendo una mayúscula, una minúscula y un número."
            } else {
                warningMessage = ""
                currentStep = .dateOfBirth
            }
        case .dateOfBirth:
            if is18YearsOld(dateOfBirth: registrationData.dateOfBirth) {
                warningMessage = ""
                currentStep = .email
            } else {
                warningMessage = "Debe tener al menos 18 años."
            }
        case .email:
            if registrationData.email.isEmpty || !isValidEmail(registrationData.email) {
                warningMessage = "Por favor, ingrese un correo electrónico válido."
            } else {
                warningMessage = ""
                currentStep = .address
            }
        case .address:
            if registrationData.address.isEmpty {
                warningMessage = "Por favor, ingrese su dirección."
            } else {
                warningMessage = ""
                currentStep = .cif
            }
        case .cif:
            if registrationData.cif.isEmpty {
                warningMessage = "Por favor, ingrese su CIF o Número de Identificación de la Empresa."
            } else {
                warningMessage = ""
                saveUserData(registrationData)
                print("Registro Completo!")
                presentationMode.wrappedValue.dismiss() // Cerrar la ventana de registro
            }
        }
    }
    
    private func previousStep() {
        if let previous = RegistrationStep(rawValue: currentStep.rawValue - 1) {
            currentStep = previous
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordRegex.evaluate(with: password)
    }
    
    private func saveUserData(_ user: RegistrationData) {
        var users = loadUsers() ?? []
        users.append(user)
        
        guard let url = getDocumentsDirectory()?.appendingPathComponent(usersFileName) else {
            print("Error: No se pudo obtener el directorio de documentos.")
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(users)
            try data.write(to: url)
            print("Datos del usuario guardados exitosamente en \(url).")
            
        } catch {
            print("Error al guardar los datos del usuario: \(error.localizedDescription)")
        }
        if let users = loadUsers() {
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
            let decoder = JSONDecoder()
            let users = try decoder.decode([RegistrationData].self, from: data)
            return users
        } catch {
            print("Error al cargar los usuarios: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func createUsersFileIfNeeded() {
        guard let url = getDocumentsDirectory()?.appendingPathComponent(usersFileName) else {
            print("Error: No se pudo obtener el directorio de documentos.")
            return
        }
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: url.path) {
            do {
                let emptyUsers: [RegistrationData] = []
                let encoder = JSONEncoder()
                let data = try encoder.encode(emptyUsers)
                try data.write(to: url)
                print("Archivo users.json creado en \(url).")
            } catch {
                print("Error al crear el archivo users.json: \(error.localizedDescription)")
            }
        } else {
            print("El archivo users.json ya existe en \(url).")
        }
    }
    
    private func getDocumentsDirectory() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}


#Preview {
    RegistrationView()
}

