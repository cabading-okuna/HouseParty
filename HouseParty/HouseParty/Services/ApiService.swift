//
//  ApiService.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

class ApiService :  NSObject {
    static let shared = ApiService()
    
    func getPostings() async -> [Posting] {
        var posting1 = Posting(id: "123", userId: "abc", postBody: "this is a test", postHeading: "this is a heading", postedTime: Date())
        return [posting1]
    }
    
    func sendRequest(path: String, type: String, parameters: [String: Any], completion: @escaping(Result<Bool, Authentication.AuthenticationError>) -> Void) {
        let Url = String(format: "http://localhost:2400/api/") + path
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = type
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(true));
                    print(json)
                } catch {
                    print(error)
                    completion(.failure(.invalidCredentials));
                }
            }
        }.resume()

        
    }
    func signUp(email:String,password:String, completion: @escaping(Result<Bool, Authentication.AuthenticationError>) -> Void) {
        sendRequest(path:"signup", type:"POST", parameters:[ "email": email, "password": password ], completion:completion)
    }
    
    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void){
        sendRequest(path: "login", type: "POST", parameters: ["email":credentials.email, "password": credentials.password], completion: completion)
  
    }
    
}
