import SwiftUI

// MARK: - Main App Structure
struct CampusNavigatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Main Content View
struct ContentView: View {
    @State private var isSignedIn = false
    @State private var showSignIn = false
    @State private var currentTab = 0
    
    var body: some View {
        if currentTab == 0 {
            LandingPageView(onGetStarted: {
                currentTab = 1
            })
        } else {
            TabView(selection: $currentTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(1)
                
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .tag(2)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(3)
                
                ExploreView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Explore")
                    }
                    .tag(4)
                
                ScheduleView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                    .tag(5)
                
                AccountView(isSignedIn: $isSignedIn, showSignIn: $showSignIn)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(6)
            }
            .accentColor(Color(red: 0.2, green: 0.5, blue: 0.4))
        }
    }
}

// MARK: - Landing Page View
struct LandingPageView: View {
    let onGetStarted: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Main content
                    VStack(spacing: 20) {
                        Text("Campus Navigator")
                            .font(.system(size: 36, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Text("Find your destination easily")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    // Get Started Button
                    Button(action: onGetStarted) {
                        HStack {
                            Text("Get Started")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color(red: 0.2, green: 0.5, blue: 0.4))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
            }
        }
    }
}

// MARK: - Account View
struct AccountView: View {
    @Binding var isSignedIn: Bool
    @Binding var showSignIn: Bool
    @State private var showSignUp = false
    @State private var showForgotPassword = false
    @State private var showPersonalInfo = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isSignedIn {
                    // Signed In State
                    SignedInAccountView(showPersonalInfo: $showPersonalInfo)
                } else if showSignIn {
                    // Sign In Form
                    SignInFormView(
                        isSignedIn: $isSignedIn,
                        showSignIn: $showSignIn,
                        showForgotPassword: $showForgotPassword
                    )
                } else if showSignUp {
                    // Sign Up Form
                    SignUpFormView(showSignUp: $showSignUp)
                } else if showForgotPassword {
                    // Forgot Password Form
                    ForgotPasswordView(showForgotPassword: $showForgotPassword)
                } else {
                    // Not Signed In State
                    NotSignedInView(showSignIn: $showSignIn, showSignUp: $showSignUp)
                }
            }
            .background(Color.white)
        }
        .sheet(isPresented: $showPersonalInfo) {
            PersonalInformationView()
        }
    }
}

// MARK: - Not Signed In View
struct NotSignedInView: View {
    @Binding var showSignIn: Bool
    @Binding var showSignUp: Bool
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 30) {
                // Profile Icon
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "person")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                }
                
                Text("Not Signed In")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.black)
                
                VStack(spacing: 15) {
                    // Sign In Button
                    Button(action: {
                        showSignIn = true
                    }) {
                        Text("Sign In")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(red: 0.2, green: 0.5, blue: 0.4))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    
                    // Create Account Link
                    HStack {
                        Text("No Account?")
                            .foregroundColor(.gray)
                        
                        Button("Create Account") {
                            showSignUp = true
                        }
                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.4))
                    }
                    .font(.system(size: 16))
                }
            }
            
            Spacer()
        }
    }
}

// MARK: - Sign In Form View
struct SignInFormView: View {
    @Binding var isSignedIn: Bool
    @Binding var showSignIn: Bool
    @Binding var showForgotPassword: Bool
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button("Close") {
                    showSignIn = false
                }
                .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 30) {
                // Profile Icon
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "person")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                }
                
                Text("Not Signed In")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                
                Text("Sign In")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                VStack(spacing: 15) {
                    // Username Field
                    TextField("Username", text: $username)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    // Password Field
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    // Sign In Button
                    Button(action: {
                        isSignedIn = true
                        showSignIn = false
                    }) {
                        Text("Sign In")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(red: 0.2, green: 0.5, blue: 0.4))
                            .cornerRadius(8)
                    }
                    
                    // Forgot Password Link
                    HStack {
                        Text("Forgot Password?")
                            .foregroundColor(.gray)
                        
                        Button("Click Here") {
                            showForgotPassword = true
                            showSignIn = false
                        }
                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.4))
                    }
                    .font(.system(size: 14))
                }
                .padding(.horizontal, 40)
            }
            
            Spacer()
        }
    }
}

// MARK: - Forgot Password View
struct ForgotPasswordView: View {
    @Binding var showForgotPassword: Bool
    @State private var email = ""
    @State private var showingConfirmation = false
    @State private var countdownTime = 48
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button("Close") {
                    showForgotPassword = false
                }
                .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 30) {
                // Profile Icon
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "person")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                }
                
                Text("Not Signed In")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                
                Text("Forgot Password")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                VStack(spacing: 15) {
                    // Email Field
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.horizontal, 40)
                    
                    // Confirm Button
                    Button(action: {
                        showingConfirmation = true
                        startCountdown()
                    }) {
                        Text("Confirm")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(red: 0.2, green: 0.5, blue: 0.4))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    
                    if showingConfirmation {
                        VStack(spacing: 10) {
                            Text("You will receive your password reset link shortly")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                            
                            Text("00:\(String(format: "%02d", countdownTime))")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            HStack {
                                Text("If not received?")
                                    .foregroundColor(.gray)
                                
                                Button("Click here") {
                                    countdownTime = 48
                                    startCountdown()
                                }
                                .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.4))
                            }
                            .font(.system(size: 14))
                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            Spacer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startCountdown() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if countdownTime > 0 {
                countdownTime -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
}

// MARK: - Sign Up Form View
struct SignUpFormView: View {
    @Binding var showSignUp: Bool
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button("Close") {
                    showSignUp = false
                }
                .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 30) {
                // Profile Icon
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "person")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                }
                
                Text("Not Signed In")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                
                Text("Sign Up")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                VStack(spacing: 15) {
                    // Name Field
                    TextField("Name", text: $name)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    // Email Field
                    TextField("Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    // Password Field
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    // Sign Up Button
                    Button(action: {
                        showSignUp = false
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color(red: 0.2, green: 0.5, blue: 0.4))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 40)
            }
            
            Spacer()
        }
    }
}

// MARK: - Signed In Account View
struct SignedInAccountView: View {
    @Binding var showPersonalInfo: Bool
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Account")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            VStack(spacing: 30) {
                // Profile Image
                AsyncImage(url: URL(string: "https://via.placeholder.com/120x120")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                
                VStack(spacing: 5) {
                    Text("John Abraham")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text("johnabraham@student.campus.com")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                VStack(spacing: 12) {
                    // Personal Information
                    Button(action: {
                        showPersonalInfo = true
                    }) {
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.gray)
                                .frame(width: 24)
                            
                            Text("Personal Information")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                    }
                    
                    // Favorite
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                                .frame(width: 24)
                            
                            Text("Favorite")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                    }
                    
                    // Reservations
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                                .frame(width: 24)
                            
                            Text("Reservations")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
    }
}

// MARK: - Personal Information View
struct PersonalInformationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = "John Abraham"
    @State private var email = "johnabraham@student.campus.com"
    @State private var contactNumber = "+94 77 211 5701"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .medium))
                            Text("Profile")
                                .font(.system(size: 16))
                        }
                        .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text("Personal Information")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.4))
                    .font(.system(size: 16, weight: .medium))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .background(Color.white)
                
                Divider()
                
                VStack(spacing: 20) {
                    // Name Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Name")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        
                        TextField("Name", text: $name)
                            .textFieldStyle(PersonalInfoTextFieldStyle())
                    }
                    
                    // Email Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(PersonalInfoTextFieldStyle())
                    }
                    
                    // Contact Number Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Contact Number")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        
                        TextField("Contact Number", text: $contactNumber)
                            .textFieldStyle(PersonalInfoTextFieldStyle())
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Custom Text Field Style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.green.opacity(0.1))
            .cornerRadius(8)
            .font(.system(size: 16))
    }
}

// MARK: - Personal Info Text Field Style
struct PersonalInfoTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .font(.system(size: 16))
    }
}

// MARK: - Placeholder Views for Other Tabs
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}

struct MapView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Map")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .navigationTitle("Map")
        }
    }
}

struct SearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
}

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Explore")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .navigationTitle("Explore")
        }
    }
}

struct ScheduleView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Schedule")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .navigationTitle("Schedule")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
