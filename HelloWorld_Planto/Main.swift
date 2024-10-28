// Main.swift
// HelloWorld_Planto
// Created by حصه العجالين on 18/04/1446 AH.

import SwiftUI

struct Main: View {
    @State private var showSetReminderSheet = false
    @State private var navigateToTodayReminderPage = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("My Plants 🌱")
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                            .background(Color.gray)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Image("Planto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 164, height: 180)
                        
                        Text("Start your plant journey!")
                            .foregroundColor(Color("whitish"))
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                        
                        Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                            .foregroundColor(Color("greengray"))
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Button(action: {
                            showSetReminderSheet = true
                        }) {
                            Text("Set Plant Reminder")
                                .frame(width: 280, height: 50)
                                .background(Color("greenbtn"))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showSetReminderSheet) {
                            SetReminderSheet(navigateToTodayReminderPage: $navigateToTodayReminderPage)
                        }
                        .background(
                            NavigationLink(destination: TodayReminderPage(), isActive: $navigateToTodayReminderPage) {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true) // Hide the back button
        }
    }
}

#Preview {
    Main()
}
