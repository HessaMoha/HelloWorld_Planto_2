//
//  RemindersCompletedPage.swift
//  HelloWorld_Planto
//
//  Created by حصه العجالين on 19/04/1446 AH.
//

import SwiftUI

struct RemindersCompletedPage: View {
    @State private var showSetReminderSheet = false
    @State private var navigateToTodayReminderPage = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading){
                Text("My Plants 🌱")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    

                Divider()
                    .background(Color.gray)
                    .padding()
                
                Spacer()
                
                
                Image("wink")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 219, height: 227)
                    .position(CGPoint(x: 190, y: 200))
                    
                
                Text("All Done! 🎉")
                    .foregroundColor(Color("whitish"))
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .position(CGPoint(x: 200, y:150))
                
                Text("All Reminders Completed")
                    .foregroundColor(Color("greengray"))
                    .font(.system(size: 16))
                    .position(CGPoint(x: 200, y: 1))
                
                
                
                
                Button(action: {
                    showSetReminderSheet = true
                        }) {
                            HStack {
                                // Circular plus icon
                                ZStack {
                                    Circle() // Create a circular background
                                        .fill(Color("greenbtn")) // Background color
                                        .frame(width: 25, height: 25) // Size of the circle
                                    
                                    Image(systemName: "plus") // Plus icon
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black) // Icon color
                                        .font(.system(size: 20 ,weight: .bold))
                                        .frame(width: 10, height: 10) // Size of the icon
                                }
                                
                                Text("New Reminder") // Button text
                                    .foregroundColor(Color("greenbtn")) // Text color
                                    .font(.system(size: 18 ))
                            }
                            
                            .frame(width: 200, height: 50) // Fixed size for the button
                            .cornerRadius(10) // Rounded corners for the button
                          
                        }
                        .sheet(isPresented: $showSetReminderSheet) {
                            SetReminderSheet(navigateToTodayReminderPage: $navigateToTodayReminderPage)
                        }
                        .background(
                            NavigationLink(destination: TodayReminderPage(), isActive: $navigateToTodayReminderPage){
                                EmptyView()
                            }
                                .hidden()
                        )
                
            }
            .navigationBarHidden(true) // Hide the back button
        }
    }

}

#Preview {
    RemindersCompletedPage()
}
