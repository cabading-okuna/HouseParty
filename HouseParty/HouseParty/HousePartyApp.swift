//
//  HousePartyApp.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

@main
struct HousePartyApp: App {
    var apiService: ApiService
    var contentViewModel: ContentViewModel
    
    init() {
        self.apiService = ApiService()
        self.contentViewModel = ContentViewModel(apiService: self.apiService)
    }
    
    var body: some Scene {
        WindowGroup {
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
                        .resizable(capInsets: EdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0))
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
            }
        }
    }
}
