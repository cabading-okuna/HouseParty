//
//  HousePartyApp.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

@main
struct HousePartyApp: App {
    var authenticationService: AuthenticationService
    var apiService: ApiService
    var contentViewModel: ContentViewModel
    var loginViewModel: LoginViewModel
    
    init() {
        var authenticationService = AuthenticationService()
        self.apiService = ApiService()
        self.contentViewModel = ContentViewModel(apiService: self.apiService)
        self.authenticationService = authenticationService
        self.loginViewModel = LoginViewModel(apiService: self.apiService, authenticationService: authenticationService)
    }
    
    var body: some Scene {
        WindowGroup {
            if authenticationService.isValidated{
                TabView{
                    NavigationView{
                        ContentView(viewModel: contentViewModel)
                    }.tabItem{
                        Image(systemName: "house.fill")
                        Text("Timeline")
                    }
                    NavigationView{
                        ChecklistView()
                    }.tabItem{
                        Image(systemName: "checkmark")
                        Text("Checklist")
                    }
                    NavigationView{
                        PostView()
                    }.tabItem{
                        Image(systemName: "plus.rectangle.fill")
                        Text("New Post")
                    }
                    NavigationView{
                        ScheduleView()
                    }.tabItem{
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                    NavigationView{
                        AccountView()
                    }.tabItem{
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
                } .environmentObject(authenticationService)
            } else {
                LoginView(loginVM: loginViewModel)
                    .environmentObject(authenticationService)
            }
        }
    }
}
