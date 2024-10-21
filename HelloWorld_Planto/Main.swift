//
//  Main.swift
//  HelloWorld_Planto
//
//  Created by حصه العجالين on 18/04/1446 AH.
//

import SwiftUI

struct Main: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text("My Plants 🌱")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)// Left alignment

                Divider()
                    .background(Color.gray)
                    .padding()
                
                Spacer()
                
                Image("Planto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 164, height: 180)
                    .position(CGPoint(x: 200, y: 140))
                    
                
                Text("Start your plant journey! ")
                    .foregroundColor(Color("whitish"))
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .position(CGPoint(x: 200, y:120))
                
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .foregroundColor(Color("greengray"))
                    .font(.system(size: 16))
                    .position(CGPoint(x: 200, y: 10))
                
                
                Button("Set Plant Reminder") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: 280,height: 40)
                .foregroundColor(.black)
                .background(Color("greenbtn"))
                .cornerRadius(10)
                .position(CGPoint(x: 200, y: -90))
                
                
                
                
            }
            
        }
    }
}

#Preview {
    Main()
}
