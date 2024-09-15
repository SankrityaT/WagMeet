//
//  LogInView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

struct LogInView: View {
    @State private var isSignedIn = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            Spacer()
            
            Image("loginIllustration")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 20)
            
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("Log in with your Google account to continue finding playdates for your pet!")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            // Google Log-In Button
            Button(action: {
                logInWithGoogle()
            }) {
                HStack {
 
                    Text("Log In with Google")
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
    
    // Google Sign-In with Firebase Authentication

    func logInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Configure Google Sign-in
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)

        // Start the sign-in flow
        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
            if let error = error {
                print("Error with Google Sign-In: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

            // Sign in to Firebase with the Google credentials
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In Error: \(error.localizedDescription)")
                } else {
                    print("User signed in successfully with Firebase!")
                    isLoggedIn = true // Set login state to true
                }
            }
        }
    }



    func getRootViewController() -> UIViewController {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = scene.windows.first?.rootViewController else {
            return UIViewController()
        }
        return rootViewController
    }
}
