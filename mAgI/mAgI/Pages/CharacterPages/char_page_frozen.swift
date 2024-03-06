//
//  frozen_char_page.swift
//  mAgI
//
//  Created by Zheng Taing on 2/11/24.
//

import SwiftUI

struct char_page_frozen: View {
    var body: some View {
        ZStack{
            Color("bg")
            
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("frozen_logo")
                    .resizable()
                    .frame(width: 200, height: 113)
                    .shadow(color: Color.black.opacity(0.28), radius: 8, x:2, y:6)
                
                CharacterLineView(char1: String("anna"), char2: String("elsa")){}
                
                CharacterLineView(char1: String("olaf"), char2: String("kristoff")){}
         
                CharacterLineView(char1: String("young_elsa"), char2: String("young_anna")){}
      
            }
            .padding()
          
      
            
            HStack{

                NavBarF(){}
                
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .shadow(color: .black.opacity(0.15), radius: 10)
            .frame(maxHeight: .infinity, alignment: .bottom)

        }
        
    }
}

struct char_page_frozen_Previews: PreviewProvider {
    static var previews: some View {
        char_page_frozen()
    }
}

struct CharacterLineView: View {
    
    
    
    
 let char1: String
 let char2: String
    let action : ()-> Void
    var body: some View {
        HStack{
  
            Button(action:action, label:{
                NavigationLink{
                    char_page_frozen_anna()
                }label:{
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: 120, height: 120)
                    
                    Image(char1)
                        .resizable()
                        .frame(width:120, height:110)
                        .clipShape(Circle())
                        .padding(.horizontal, -128)
                    
                }
                
                
                
                
            })
           
            
            Spacer()
            
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 120, height: 120)
            
            Image(char2)
                .resizable()
                .frame(width:120, height:110)
                .clipShape(Circle())
                .padding(.horizontal, -128)
        }
        .padding(.horizontal,60)
    }
 
      
}

struct NavBarF: View {
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
                Image("search-filled")
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
                Image("social")
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
