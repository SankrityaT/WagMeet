//
//  OnboardingView.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false // Track if onboarding has been seen
    
    let onboardingSteps = [
        OnboardingStep(image: "onboarding1", title: "Welcome to WagMeet", description: "Find playdates for your pets with nearby pet owners."),
        OnboardingStep(image: "onboarding2", title: "Connect and Meet", description: "Connect with other pet lovers and arrange playdates based on personality and size."),
        OnboardingStep(image: "onboarding3", title: "Safe & Fun", description: "Join a safe, pet-friendly community and make friends.")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onboardingSteps.count, id: \.self) { index in
                        VStack {
                            Image(onboardingSteps[index].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .padding()
                            
                            Text(onboardingSteps[index].title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                            
                            Text(onboardingSteps[index].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeInOut, value: currentStep)
                .padding(.bottom, 100)

                Spacer()

                HStack {
                    // Skip Button
                    Button(action: {
                        hasSeenOnboarding = true // Skip the onboarding
                    }) {
                        Text("Skip")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    // Next or Get Started Button
                    Button(action: {
                        if currentStep < onboardingSteps.count - 1 {
                            currentStep += 1
                        } else {
                            hasSeenOnboarding = true // Finish onboarding
                        }
                    }) {
                        Text(currentStep == onboardingSteps.count - 1 ? "Get Started" : "Next")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)

                Spacer()

                // NavigationLink to MainTabView
                NavigationLink(destination: DashboardView(), isActive: $hasSeenOnboarding) {
                    EmptyView() // NavigationLink triggers automatically when onboarding is completed or skipped
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    OnboardingView()
}
