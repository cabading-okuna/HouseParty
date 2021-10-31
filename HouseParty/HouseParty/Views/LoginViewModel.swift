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
    
    var signinDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void){
    showProgressView = true
        ApiService.shared.login(credentials: credentials) { [unowned self] (result:Result<Bool, Authentication.AuthenticationError>) in
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
