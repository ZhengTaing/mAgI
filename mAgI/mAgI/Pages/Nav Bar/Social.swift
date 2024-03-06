//
//  Social.swift
//  mAgI
//
//  Created by Zheng Taing on 2/23/24.
//

import SwiftUI

struct Social: View {
    var body: some View {
        Text("Social!")
        
        HStack{

            NavBarS(){}
            
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding()
        .shadow(color: .black.opacity(0.15), radius: 10)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
        
        
}


#Preview {
    Social()
}


struct NavBarS: View {
  //  let image: Image
    let action:()-> Void

    
    var body: some View {
        Button(action: action, label: {
            NavigationLink{
                HomeScreen()
                    .navigationBarBackButtonHidden(true)
                
            }label:{
                Image("home")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        Button(action: action, label: {
            NavigationLink{
                Search()
                    .navigationBarBackButtonHidden(true)
                
            }label:{
                Image("search")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        Button(action: action, label: {
            NavigationLink{
                Social()
                    .navigationBarBackButtonHidden(true)
                
            }label:{
                Image("social-filled")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        Button(action: action, label: {
            NavigationLink{
                Message()
                    .navigationBarBackButtonHidden(true)
                
            }label:{
                Image("message")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        
        Button(action: action, label: {
            NavigationLink{
                ProfilePage()
                    .navigationBarBackButtonHidden(true)
                
            }label:{
                Image("profile")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        
        
        
        
        
        
        
        
    }
}
