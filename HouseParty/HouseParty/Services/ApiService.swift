//
//  ApiService.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

class ApiService :  NSObject {
    
    var cookie:String? = nil
    
    enum ApiError: Error {
        case error(String)
    }
    
    struct VoidApiResult:Decodable {
        var status: String;
        var error: String;
    }
    
    func sendRequest<T:Decodable>(path: String, type: String, parameters: [String: Any]) async throws -> T {
        let url = String(format: "http://localhost:3000/api/") + path
        guard let serviceUrl = URL(string: url) else { throw ApiError.error("bad url") }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = type
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { throw ApiError.error("could not serialize data") }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        
        let (data, urlResponse) = try await URLSession.shared.data(for: request)
        
        let result = try JSONDecoder().decode(T.self, from: data);
        return result;
    }
    
    func createPosting(newPosting: Posting) async throws -> VoidApiResult {
        do {
            let result:VoidApiResult = try await sendRequest(path:"postings/new", type: "POST", parameters: [:])
            return result;
        }
        catch {
            throw error;
        }
    }
    
    func getPostings() async throws -> [Posting] {
        do {
            let result:[Posting] = try await sendRequest(path:"postings/get", type:"POST", parameters:[:])
            return result;
        }
        catch {
            throw error;
        }
    }
    
    func signUp(email:String, password:String) async throws -> User {
        do {
            let result:User = try await sendRequest(path:"signup", type:"POST", parameters:[ "email": email, "password": password ])
            return result;
        }
        catch {
            throw error;
        }
    }
    
    func login(email:String, password:String) async throws -> User {
        do {
            let result:User = try await sendRequest(path:"login", type:"POST", parameters:[ "email": email, "password": password ])
            return result;
        }
        catch {
            throw error;
        }
    }
    
}
