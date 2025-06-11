import SwiftUI
import MapKit

// MARK: - Main App (Remove @main since you already have it in your existing app file)

// MARK: - Content View (App Entry Point)
struct ContentView: View {
    @State private var isSignedIn = false
    @State private var currentUser: User?
    @State private var showingApp = false
    
    var body: some View {
        if !showingApp {
            LandingPageView(onGetStarted: {
                showingApp = true
            })
        } else {
            TabView {
                HomePageView(user: currentUser)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                ExploreView()
                    .tabItem {
                        Image(systemName: "location.fill")
                        Text("Explore")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                ProfileTabView(
                    currentUser: currentUser,
                    isSignedIn: isSignedIn,
                    onSignIn: { user in
                        currentUser = user
                        isSignedIn = true
                    },
                    onSignOut: {
                        isSignedIn = false
                        currentUser = nil
                    }
                )
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            }
            .accentColor(Color(red: 0.2, green: 0.4, blue: 0.3))
        }
    }
}

// MARK: - User Model
struct User {
    let name: String
    let email: String
    let contactNumber: String
    let profileImage: String?
}

// MARK: - Landing Page
struct LandingPageView: View {
    let onGetStarted: () -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Campus Navigator")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Find your destination easily")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: onGetStarted) {
                    HStack {
                        Text("Get Started")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .cornerRadius(8)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
            .background(Color(.systemGray6))
        }
    }
}

// MARK: - Explore View (Replacing Map View)
struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Find lecture halls...", text: $searchText)
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    // Categories Section
                    VStack(alignment: .leading, spacing: 20) {
                        // Lecture Halls Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "building.2")
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
                                Text("Lecture Halls")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 15) {
                                ExploreCard(
                                    title: "Hall 18",
                                    subtitle: "Ground Floor, Harrison Building",
                                    imageName: "lecture_hall_1",
                                    color: .brown
                                )
                                
                                ExploreCard(
                                    title: "Hall 22",
                                    subtitle: "2nd Floor, Harrison Building",
                                    imageName: "lecture_hall_2",
                                    color: .brown
                                )
                                
                                ExploreCard(
                                    title: "Hall 301",
                                    subtitle: "3rd Floor, Main Building",
                                    imageName: "lecture_hall_3",
                                    color: .brown
                                )
                            }
                            .padding(.horizontal)
                        }
                        
                        // Laboratories Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "desktopcomputer")
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
                                Text("Laboratories")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 15) {
                                ExploreCard(
                                    title: "Lab 1",
                                    subtitle: "Computer Lab, IT Building",
                                    imageName: "computer_lab_1",
                                    color: .blue
                                )
                                
                                ExploreCard(
                                    title: "Lab 2",
                                    subtitle: "Programming Lab, IT Building",
                                    imageName: "computer_lab_2",
                                    color: .blue
                                )
                            }
                            .padding(.horizontal)
                        }
                        
                        // Quick Access Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
                                Text("Quick Access")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 15) {
                                QuickAccessCard(
                                    title: "Main Building",
                                    subtitle: "Reception & Administration",
                                    icon: "building.columns",
                                    color: .orange
                                )
                                
                                QuickAccessCard(
                                    title: "Library",
                                    subtitle: "Study & Research Center",
                                    icon: "books.vertical",
                                    color: .purple
                                )
                                
                                QuickAccessCard(
                                    title: "Dining",
                                    subtitle: "Cafeteria & Food Court",
                                    icon: "fork.knife",
                                    color: .green
                                )
                                
                                QuickAccessCard(
                                    title: "Parking",
                                    subtitle: "Vehicle Parking Areas",
                                    icon: "car",
                                    color: .red
                                )
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Explore")
        }
    }
}

// MARK: - Explore Card Component
struct ExploreCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            // Image placeholder with actual university-style images
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 80)
                .overlay(
                    Image(systemName: getImageIcon())
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                )
            
            VStack(spacing: 2) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func getImageIcon() -> String {
        if imageName.contains("lecture") {
            return "person.3"
        } else if imageName.contains("computer") {
            return "laptopcomputer"
        }
        return "building"
    }
}

// MARK: - Quick Access Card Component
struct QuickAccessCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

// MARK: - Profile Tab View (Handles both signed in and signed out states)
struct ProfileTabView: View {
    let currentUser: User?
    let isSignedIn: Bool
    let onSignIn: (User) -> Void
    let onSignOut: () -> Void
    
    @State private var showingAccountFlow = false
    
    var body: some View {
        if isSignedIn, let user = currentUser {
            AccountPageView(user: user, onSignOut: onSignOut)
        } else {
            NavigationView {
                NoAccountView(
                    onCreateAccount: {
                        showingAccountFlow = true
                    },
                    onSignIn: {
                        showingAccountFlow = true
                    }
                )
                .sheet(isPresented: $showingAccountFlow) {
                    AccountFlowView(onSignIn: onSignIn)
                }
            }
        }
    }
}

struct AccountFlowView: View {
    let onSignIn: (User) -> Void
    @State private var currentView: AccountFlowType = .signIn
    @Environment(\.dismiss) private var dismiss
    
    enum AccountFlowType {
        case signIn, signUp, forgotPassword, noAccount
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch currentView {
                case .noAccount:
                    NoAccountView(onCreateAccount: {
                        currentView = .signUp
                    }, onSignIn: {
                        currentView = .signIn
                    })
                case .signIn:
                    SignInView(
                        onSignIn: onSignIn,
                        onForgotPassword: { currentView = .forgotPassword },
                        onSignUp: { currentView = .signUp }
                    )
                case .signUp:
                    SignUpView(
                        onSignUp: onSignIn,
                        onSignIn: { currentView = .signIn }
                    )
                case .forgotPassword:
                    ForgotPasswordView(onBack: {
                        currentView = .signIn
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - No Account View
struct NoAccountView: View {
    let onCreateAccount: () -> Void
    let onSignIn: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer().frame(height: 20)
            
            Image(systemName: "person.circle")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("Not Signed In")
                .font(.title3)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: onCreateAccount) {
                Text("No Account? Create Account")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: onSignIn) {
                Text("Sign In")
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.2, green: 0.4, blue: 0.3), lineWidth: 1)
                    )
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .padding()
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Sign In View
struct SignInView: View {
    let onSignIn: (User) -> Void
    let onForgotPassword: () -> Void
    let onSignUp: () -> Void
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer().frame(height: 20)
            
            Image(systemName: "person.circle")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("Not Signed In")
                .font(.title3)
                .foregroundColor(.secondary)
            
            VStack(spacing: 15) {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            Button(action: {
                // Mock sign in
                let user = User(name: "John Abraham", email: email.isEmpty ? "john@example.com" : email, contactNumber: "+94 77 211 9921", profileImage: nil)
                onSignIn(user)
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button("Forgot Password? Click here") {
                onForgotPassword()
            }
            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
            
            Spacer()
            
            Button("Don't have an account? Sign Up") {
                onSignUp()
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Sign Up View
struct SignUpView: View {
    let onSignUp: (User) -> Void
    let onSignIn: () -> Void
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer().frame(height: 20)
            
            Image(systemName: "person.circle")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("Not Signed In")
                .font(.title3)
                .foregroundColor(.secondary)
            
            VStack(spacing: 15) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            Button(action: {
                // Mock sign up
                let user = User(name: name.isEmpty ? "John Abraham" : name, email: email.isEmpty ? "john@example.com" : email, contactNumber: "+94 77 211 9921", profileImage: nil)
                onSignUp(user)
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button("Already have an account? Sign In") {
                onSignIn()
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Forgot Password View
struct ForgotPasswordView: View {
    let onBack: () -> Void
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer().frame(height: 20)
            
            Image(systemName: "person.circle")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("Not Signed In")
                .font(.title3)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Email")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            .padding(.horizontal)
            
            Button(action: {
                // Mock password reset
                onBack()
            }) {
                Text("Confirm")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.2, green: 0.4, blue: 0.3))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Text("You will receive an email with a link for doing password reset")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Don't Click here") {
                onBack()
            }
            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.3))
            
            Spacer()
        }
        .padding()
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Account Page View
struct AccountPageView: View {
    let user: User
    let onSignOut: () -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 15) {
                    AsyncImage(url: URL(string: user.profileImage ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    
                    Text(user.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                
                // Personal Information Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Personal Information")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("Name")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(user.name)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        
                        Divider()
                        
                        HStack {
                            Text("Email")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(user.email)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        
                        Divider()
                        
                        HStack {
                            Text("Contact Number")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(user.contactNumber)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                    }
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Menu Items
                VStack(spacing: 0) {
                    NavigationLink(destination: Text("Tickets & Reservations")) {
                        HStack {
                            Image(systemName: "ticket")
                            Text("Tickets & Reservations")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: Text("Favorites")) {
                        HStack {
                            Image(systemName: "heart")
                            Text("Favorites")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .foregroundColor(.primary)
                    }
                }
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") {
                        onSignOut()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

// MARK: - Home Page View (Updated with better images and names)
struct HomePageView: View {
    let user: User?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header with user info (only if signed in)
                    if let user = user {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hello,")
                                    .foregroundColor(.secondary)
                                Text(user.name)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                            AsyncImage(url: URL(string: user.profileImage ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        }
                        .padding()
                    } else {
                        // Generic header for non-signed in users
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Welcome to")
                                    .foregroundColor(.secondary)
                                Text("Campus Navigator")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search", text: .constant(""))
                            .disabled(true)
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
               
                    
                    // Categories Section
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Lecture Halls")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                HomeCard(title: "Hall 18", subtitle: "Ground Floor", color: .brown, icon: "person.3")
                                HomeCard(title: "Hall 22", subtitle: "2nd Floor", color: .brown, icon: "person.3")
                                HomeCard(title: "Hall 301", subtitle: "3rd Floor", color: .brown, icon: "person.3")
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Computer Labs")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                HomeCard(title: "Lab 1", subtitle: "Computer Lab", color: .blue, icon: "laptopcomputer")
                                HomeCard(title: "Lab 2", subtitle: "Programming Lab", color: .blue, icon: "desktopcomputer")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Home Card Component
struct HomeCard: View {
    let title: String
    let subtitle: String
    let color: Color
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Rectangle()
                .fill(color)
                .frame(width: 120, height: 80)
                .cornerRadius(8)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                )
            
            VStack(spacing: 2) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
    }
}



// MARK: - Search View
struct SearchView: View {
    @State private var searchText = ""

    // Define the arrays here
    let recentSearches = ["Library", "Cafeteria", "Gym"]
    let popularDestinations = ["Auditorium", "Main Hall", "IT Center"]

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List {
                    Section("Recent") {
                        ForEach(recentSearches, id: \.self) { search in
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.secondary)
                                Text(search)
                                Spacer()
                            }
                        }
                    }
                    
                    Section("Popular Destinations") {
                        ForEach(popularDestinations, id: \.self) { destination in
                            HStack {
                                Image(systemName: "location")
                                    .foregroundColor(.secondary)
                                Text(destination)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}


// MARK: - Search Bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search destinations...", text: $text)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
