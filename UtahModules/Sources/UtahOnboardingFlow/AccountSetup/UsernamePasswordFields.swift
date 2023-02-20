//
// This source file is part of the CardinalKit open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import Views


struct UsernamePasswordFields: View {
    @Binding private var valid: Bool
    @Binding private var username: String
    @Binding private var password: String
    
    @State private var passwordRepeat: String = ""
    
    @State private var usernameValid = false
    @State private var passwordValid = false
    @State private var passwordRepeatValid = false
    
    private var emailValidationRule: ValidationRule {
        guard let regex = try? Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") else {
            fatalError("Invalid E-Mail Regex in the EmailPasswordAccountService")
        }
        
        return ValidationRule(
            regex: regex,
            message: String(localized: "EAP_EMAIL_VERIFICATION_ERROR", bundle: .module)
        )
    }
    
    var body: some View {
        Group {
            usernameTextField
            Divider()
            passwordSecureField
            Divider()
            passwordRepeatSecureField
        }
            .onChange(of: usernameValid) { _ in
                updateValid()
            }
            .onChange(of: passwordValid) { _ in
                updateValid()
            }
            .onChange(of: passwordRepeatValid) { _ in
                updateValid()
            }
            .onChange(of: password) { _ in
                updateValid()
            }
            .onChange(of: passwordRepeat) { _ in
                updateValid()
            }
    }
    
    private var usernameTextField: some View {
        VerifiableTextRow(
            text: $username,
            valid: $usernameValid,
            validationRules: [emailValidationRule],
            description: {
                Text("Email")
            },
            textField: { binding in
                TextField(text: binding) {
                    Text("Email")
                }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textContentType(.username)
            }
        )
    }
    
    private var passwordSecureField: some View {
        VerifiableTextRow(
            text: $password,
            valid: $passwordValid,
            validationRules: [],
            description: {
                Text("Password")
            },
            textField: { binding in
                SecureField(text: binding) {
                    Text("Password")
                }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .textContentType(.newPassword)
            }
        )
    }
    
    private var passwordRepeatSecureField: some View {
        VerifiableTextRow(
            text: $passwordRepeat,
            valid: $passwordRepeatValid,
            validationRules: [],
            description: {
                Text("Password Verification")
            },
            textField: { binding in
                VStack {
                    SecureField(text: binding) {
                        Text("Password")
                    }
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .textContentType(.newPassword)
                    if password != passwordRepeat && !passwordRepeat.isEmpty {
                        HStack {
                            Text("Passwords Not Equal")
                                .fixedSize(horizontal: false, vertical: true)
                                .gridColumnAlignment(.leading)
                                .font(.footnote)
                                .foregroundColor(.red)
                            Spacer(minLength: 0)
                        }
                    }
                }
            }
        )
    }
    
    
    init(
        username: Binding<String>,
        password: Binding<String>,
        valid: Binding<Bool>
    ) {
        self._username = username
        self._password = password
        self._valid = valid
    }
    
    
    private func updateValid() {
        valid = usernameValid
            && passwordValid
            && passwordRepeatValid
            && password == passwordRepeat
    }
}


#if DEBUG
struct UsernamePasswordFields_Previews: PreviewProvider {
    @State private static var username: String = ""
    @State private static var password: String = ""
    @State private static var valid = false
    
    
    private static var validationRules: [ValidationRule] {
        guard let regex = try? Regex("[a-zA-Z]") else {
            return []
        }
        
        return [
            ValidationRule(
                regex: regex,
                message: "Validation failed: Required only letters."
            )
        ]
    }
    
    static var previews: some View {
        Form {
            Section {
                Grid(horizontalSpacing: 8, verticalSpacing: 8) {
                    UsernamePasswordFields(
                        username: $username,
                        password: $password,
                        valid: $valid
                    )
                }
            }
            Section {
                Grid(horizontalSpacing: 8, verticalSpacing: 8) {
                    UsernamePasswordFields(
                        username: $username,
                        password: $password,
                        valid: $valid
                    )
                }
            }
        }
    }
}
#endif
