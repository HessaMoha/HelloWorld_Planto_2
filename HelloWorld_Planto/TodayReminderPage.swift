//
//  TodayReminderPage.swift
//  HelloWorld_Planto
//
//  Created by حصه العجالين on 19/04/1446 AH.
//

import SwiftUI

struct TodayReminderPage: View {
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
                
                
                
                
                Button(action: {
                            // Action to perform when the button is tapped
                            
                        }) {
                            HStack {
                                // Circular plus icon
                                ZStack {
                                    Circle() // Create a circular background
                                        .fill(Color("greenbtn")) // Background color
                                        .frame(width: 40, height: 40) // Size of the circle
                                    
                                    Image(systemName: "plus") // Plus icon
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black) // Icon color
                                        .frame(width: 20, height: 20) // Size of the icon
                                }
                                
                                Text("New Reminder") // Button text
                                    .foregroundColor(Color("greenbtn")) // Text color
                            }
                            .padding()
                            .frame(width: 200, height: 50) // Fixed size for the button
                            .cornerRadius(10) // Rounded corners for the button
                            .position(CGPoint(x: 90, y: 600))
                        }
               
                
                
                
                
                
                
                
                
                
                
            }
            
        }
    }
}

#Preview {
    TodayReminderPage()
}
