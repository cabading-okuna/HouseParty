//
//  ApiService.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation
import SwiftUI

class ApiService :  NSObject {
    
    
    let baseUrl = "http://localhost:3000";
    
    enum ApiError: Error {
        case error(String)
    }
    
    struct VoidApiResult:Decodable {
        var status: String?;
        var error: String?;
    }
    
    func sendRequest<T:Decodable, D:Codable>(path: String, type: String, parameters: [String: D]) async throws -> T {
        let url = String(format: baseUrl + "/api/") + path
        print("apiService: \(type) \(url)")
        guard let serviceUrl = URL(string: url) else { throw ApiError.error("bad url") }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = type
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try! JSONEncoder().encode(parameters)

        request.httpBody = jsonData
        request.timeoutInterval = 20
        
        let config = URLSessionConfiguration.default
        config.httpCookieAcceptPolicy = .always
        config.httpShouldSetCookies = true
        config.httpCookieStorage = HTTPCookieStorage.shared
        
        let (data, urlResponse) = try await URLSession(configuration: config).data(for: request)
        
        let result = try JSONDecoder().decode(T.self, from: data);
        return result;
    }
    
    func checkIfLoggedIn() async throws -> VoidApiResult {
        do {
            let result:VoidApiResult = try await sendRequest(path:"status", type: "POST", parameters: ["":""])
            return result;
        }
        catch {
            throw error;
        }
    }
    
    func createPosting(newPosting: Posting) async throws -> VoidApiResult {
        do {
            let result:VoidApiResult = try await sendRequest(path:"postings/new", type: "POST", parameters: ["posting":newPosting])
            return result;
        }
        catch {
            throw error;
        }
    }
    
    func getPostings() async throws -> [Posting] {
        do {
            let result:[Posting] = try await sendRequest(path:"postings/get", type:"POST", parameters: ["":""])
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
