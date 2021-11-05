//
//  HousePartyApp.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

@main
struct HousePartyApp: App {
    @ObservedObject var authenticationService: AuthenticationService
    var apiService: ApiService
    var postViewModel: PostViewModel
    var loginViewModel: LoginViewModel
    
    init() {
        var authenticationService = AuthenticationService()
        self.authenticationService = authenticationService
        self.apiService = ApiService()
        // self.contentViewModel = ContentViewModel(apiService: self.apiService)
        self.postViewModel = PostViewModel(apiService: self.apiService)
        self.loginViewModel = LoginViewModel(apiService: self.apiService, authenticationService: authenticationService)
        setup()
    }
    
    func setup() {

    }
    
    var body: some Scene {
        let createPostVM = CreatePostViewModel(apiService: self.apiService)
        let createPostView = CreatePostView(vm: createPostVM, posting: Posting())
        WindowGroup {
            if authenticationService.isValidated{
                TabView{
                    NavigationView{
                        PostTabView(viewModel: postViewModel)
                    }.tabItem{
                        Image(systemName: "house.fill")
                        Text("Timeline")
                    }
                    NavigationView{
                        ChecklistTabView()
                    }.tabItem{
                        Image(systemName: "checkmark")
                        Text("Checklist")
                    }
                    NavigationView{
                        CreatePostTabView(createPostView: createPostView)
                    }.tabItem{
                        Image(systemName: "plus.rectangle.fill")
                        Text("New Post")
                    }
                    NavigationView{
                        ScheduleTabView()
                    }.tabItem{
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                    NavigationView{
                        AccountTabView()
                    }.tabItem{
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
                }
            } else {
                LoginView(loginVM: loginViewModel)
            }
        }
    }
}
