//
//  Splash.swift
//  HelloWorld_Planto
//
//  Created by حصه العجالين on 18/04/1446 AH.
//

import SwiftUI

struct Splash: View {
//نعرف متغير
@State private var isActive = false
// بدل ما اكتب كل شوي رقم اوحده واخليه في متغير الكل يستخدمه ذا للانميشن
@State private var size = 0.8
//ذا لل
@State private var op = 0.5

var body: some View {
    if isActive {
        //لو صفحه اشتغلت روح بعدها للصفحه ثانيه
        Main()
    }
    else{
        ZStack{
            Color.black.ignoresSafeArea()
            
            
            VStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 120,height: 130)
                    .cornerRadius(20)
                
                
                Text("Planto")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("")
                Text("Plant Care reminders 🌿")
                    .foregroundColor(Color.white)
            }
            //  ذا كود علشان يتحرك لوغو والكلام لقدام شوي
            .scaleEffect(size)
            .opacity(op)
            .onAppear{
                //مده التحرك
                withAnimation(.easeIn(duration: 3)){
                    self.size = 0.9
                    self.op = 1.0
                    
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                withAnimation {
                    self.isActive = true
                }
                
            }
        }
       
    }
}
}

#Preview {
Splash()
}
