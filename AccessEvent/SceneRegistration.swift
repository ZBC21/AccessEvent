//
//  SceneRegistration.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 28/5/24.
//

import SwiftUI

struct NameStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            TextField("Nombre", text: $registrationData.name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Apellido", text: $registrationData.surname)
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

struct AgeStepView: View {
    @Binding var registrationData: RegistrationData
    @Binding var warningMessage: String
    
    var body: some View {
        VStack {
            TextField("Edad", text: $registrationData.age)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
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
            TextField("CIF o Número de Identificación de la Empresa", text: $registrationData.cif)
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

struct RegistrationView: View {
    @State private var currentStep: RegistrationStep = .name
    @State private var registrationData = RegistrationData()
    @State private var warningMessage: String = ""
    
    var body: some View {
        VStack {
            ProgressView(value: Double(currentStep.rawValue) / Double(RegistrationStep.allCases.count - 1))
                .padding()
            
            Spacer()
            
            switch currentStep {
            case .name:
                NameStepView(registrationData: $registrationData, warningMessage: $warningMessage)
            case .age:
                AgeStepView(registrationData: $registrationData, warningMessage: $warningMessage)
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
                    if validateCurrentStep() {
                        nextStep()
                    }
                }) {
                    Text(currentStep == .cif ? "Finalizar" : "Siguiente")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func validateCurrentStep() -> Bool {
        warningMessage = ""
        
        switch currentStep {
        case .name:
            if registrationData.name.isEmpty || registrationData.surname.isEmpty {
                warningMessage = "Por favor, ingrese su nombre y apellido."
                return false
            }
        case .age:
            if let age = Int(registrationData.age), age > 0 {
                return true
            } else {
                warningMessage = "Por favor, ingrese una edad válida."
                return false
            }
        case .email:
            if isValidEmail(registrationData.email) {
                return true
            } else {
                warningMessage = "Por favor, ingrese un correo electrónico válido."
                return false
            }
        case .address:
            if registrationData.address.isEmpty {
                warningMessage = "Por favor, ingrese su dirección."
                return false
            }
        case .cif:
            if registrationData.cif.isEmpty {
                warningMessage = "Por favor, ingrese el CIF o número de identificación de la empresa."
                return false
            }
        }
        return true
    }
    
    private func nextStep() {
        if let next = RegistrationStep(rawValue: currentStep.rawValue + 1) {
            currentStep = next
        } else {
            // Registration complete, handle accordingly
        }
    }
    
    private func previousStep() {
        if let previous = RegistrationStep(rawValue: currentStep.rawValue - 1) {
            currentStep = previous
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Simple regex to validate email
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

#Preview {
    RegistrationView()
}
