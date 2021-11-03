//
//  SigninViewModel.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/31/21.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    
    var apiService: ApiService
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    var signinDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func signup(completion: @escaping (Bool) -> Void){
    showProgressView = true
        apiService.signUp(email: credentials.email, password: credentials.password) { [unowned self] (result:Result<Bool, Authentication.AuthenticationError>) in
        showProgressView = false
            switch result{
            case .success:
                completion(true)
            case .failure(let urlError):
                credentials = Credentials()
                error = urlError
                completion(false)
            }
        }
    }
    
    func login(completion: @escaping (Bool) -> Void){
    showProgressView = true
        apiService.login(credentials: credentials) { [unowned self] (result:Result<Bool, Authentication.AuthenticationError>) in
        showProgressView = false
            switch result{
            case .success:
                completion(true)
            case .failure(let authError):
                credentials = Credentials()
                error = authError
                completion(false)
            }
        }
    }
}
