import SwiftUI

struct ContentView: View {
    @State private var showMainApp = false
    
    var body: some View {
        if showMainApp {
            MainTabView()
        } else {
            LandingPageView(showMainApp: $showMainApp)
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ExplorePageView()
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Explore")
                }
            
            SchedulePageView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
        .accentColor(.primaryGreen)
    }
}

#Preview {
    ContentView()
}
