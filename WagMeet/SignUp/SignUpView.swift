import SwiftUI

struct SignUpView: View {
    @State private var isSignedIn = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("signupIllustration")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
            
            Text("Create Your Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("Sign up with your Google account to find playdates for your pet!")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            // Google Sign-In Button
            Button(action: {
                signInWithGoogle() // Placeholder for future backend functionality
            }) {
                HStack {
                    Image(systemName: "globe")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Sign Up with Google")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
    
    // Placeholder for future Google sign-in logic
    func signInWithGoogle() {
        // Google sign-in will be handled later
    }

    func getRootViewController() -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }
}

#Preview {
    SignUpView()
}
