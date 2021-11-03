//
//  Authentication.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/31/21.
//

import Foundation
import SwiftUI

class Authentication: ObservableObject{
    @Published var isValidated = false
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        case duplicateEmail
        
        var id: String{
            self.localizedDescription
        }
        var errorDescription: String? {
            switch self {
                case .invalidCredentials:
                    return NSLocalizedString("Email or Password is incorrect. Please try again.", comment: "")
                case .duplicateEmail:
                    return NSLocalizedString("This email is already in use", comment: "")
            }
        }
    }
    func updateValidation(success: Bool){
        withAnimation{
            isValidated = success
        }
    }
}
