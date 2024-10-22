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
                
                
                    

                
                
                Spacer()
                Text("Today")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .position(CGPoint(x: 60, y: 50))
                
                
                
                
                Button(action: {
                            // Action to perform when the button is tapped
                            
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
                            .padding()
                            .frame(width: 200, height: 50) // Fixed size for the button
                            .cornerRadius(10) // Rounded corners for the button
                            
                        }
               
                
                
                
                
                
                
                
                
                
                
            }
            
        }
    }
}

#Preview {
    TodayReminderPage()
}