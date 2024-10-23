import SwiftUI

// ViewModel to manage the data for SettingsView
final class SettingsViewModel: ObservableObject {
    @Published var uid: String = ""
    @Published var email: String = ""

    // Computed property to extract the name part from the email
    var userName: String {
        if let email = email.split(separator: "@").first {
            return String(email)
        } else {
            return "Unknown"
        }
    }

    init() {
        fetchAuthenticatedUser()
    }

    func fetchAuthenticatedUser() {
        do {
            let user = try AuthenticationManager.shared.getAuthenticatedUser()
            self.uid = user.uid
            self.email = user.email ?? "No email"
        } catch {
            print("Failed to get authenticated user: \(error.localizedDescription)")
        }
    }
}

struct SettingsView: View {
    // Using the ViewModel to fetch user details
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        VStack {
            Text("User ID: \(viewModel.uid)")
                .font(.headline)
            Text("User Name: \(viewModel.userName)") // Display the extracted user name
                .font(.headline)
                .padding(.top, 5)
            Text("Email: \(viewModel.email)")
                .font(.headline)
                .padding(.top, 5)

            Spacer()

            // Button to navigate to another page
            NavigationLink(destination: AnotherView()) {
                Text("Go to Another Page")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
        }
        .padding()
        .navigationTitle("Settings")
    }
}

struct AnotherView: View {
    var body: some View {
        Text("This is another page!")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

