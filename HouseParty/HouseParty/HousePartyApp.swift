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
    var checklistViewModel: ChecklistViewModel
    
    init() {
        var authenticationService = AuthenticationService()
        self.authenticationService = authenticationService
        self.apiService = ApiService()
        self.postViewModel = PostViewModel(apiService: self.apiService)
        self.checklistViewModel = ChecklistViewModel(apiService: self.apiService)
        self.loginViewModel = LoginViewModel(apiService: self.apiService, authenticationService: authenticationService)
    }
    
    var body: some Scene {
        let createPostVM = CreatePostViewModel(apiService: self.apiService)
        let createPostView = CreatePostView(vm: createPostVM, posting: Posting())
        let createChecklistVM = CreateChecklistViewModel(apiService: self.apiService)
        let createChecklistView = CreateChecklistView(vm: createChecklistVM, checklistTasks: ChecklistTasks())

        WindowGroup {
            if authenticationService.isValidated{
                TabView{
                    NavigationView{
                        PostView(viewModel: postViewModel)
                    }.tabItem{
                        Image(systemName: "house.fill")
                        Text("Timeline")
                    }
                    NavigationView{
                        ChecklistTabView(viewModel: checklistViewModel, createChecklistView: createChecklistView)
                    }.tabItem{
                        Image(systemName: "checkmark")
                        Text("Checklist")
                    }
                    NavigationView{
                        LiveView(createPostView: createPostView)
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
