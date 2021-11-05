//
//  SigninViewModel.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/31/21.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject{
    
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: AuthenticationService.AuthenticationError?
    
    var apiService: ApiService
    var authenticationService: AuthenticationService
    
    init(apiService:ApiService, authenticationService:AuthenticationService) {
        self.apiService = apiService
        self.authenticationService = authenticationService
    }
    
    var signinDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func checkIfSignedIn() async {
        do {
            let result = try await apiService.checkIfLoggedIn();
            if (result.status == "loggedin") {
                authenticationService.isValidated = true;
            }
        } catch {
            print (error)
        }
    }
    
    func signup() async {
        showProgressView = true
        do {
            let result = try await apiService.signUp(email: credentials.email, password: credentials.password)
            authenticationService.updateValidation(success: true);
            showProgressView = false
        } catch {
            print(error)
        }
    }

    func login() async {
        showProgressView = true
        do {
            let result = try await apiService.login(email: credentials.email, password: credentials.password)
            authenticationService.updateValidation(success: true);
            showProgressView = false
        } catch {
            print(error)
        }
    }
}
