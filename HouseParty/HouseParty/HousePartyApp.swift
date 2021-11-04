//
//  HousePartyApp.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

@main
struct HousePartyApp: App {
    @StateObject var authentication =  Authentication()
    var apiService: ApiService
    var contentViewModel: ContentViewModel
    var loginViewModel: LoginViewModel
    
    init() {
        self.apiService = ApiService()
        self.contentViewModel = ContentViewModel(apiService: self.apiService)
        self.loginViewModel = LoginViewModel(apiService: self.apiService)
    }
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
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
                        LiveView()
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
                } .environmentObject(authentication)
            } else {
                LoginView(loginVM: loginViewModel)
                    .environmentObject(authentication)
            }
        }
    }
}
