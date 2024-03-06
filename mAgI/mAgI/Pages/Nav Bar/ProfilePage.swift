//
//  ProfilePage.swift
//  mAgI
//
//  Created by Zheng Taing on 2/12/24.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false){
                    Logo()
                    Profile()
                    
                }
                
                HStack{

                    NavBarPP(){}
                    
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
    
    
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
        
    }
}

struct Logo: View {
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(){
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 35)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical,-1)
                    .padding(.horizontal,1)
           
            }
 
            }
        }
    }


struct Profile: View {
    var body: some View {
        VStack() {
            Image("Image")
                .frame(width: 70, height: 70)
                .scaledToFit()
                .clipShape(Circle())
            
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 75, height: 75)
                .padding(.vertical,-80.5)
            Text(User.MOCK_USER.username)
                .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
                .padding(.vertical,-4)
        }
        .padding(.vertical,40)
        
        
        
        //SIGNING OUT BUTTON
        
        VStack(){
            Button{
                print("Signing out")
            } label: {
                HStack{
                    NavigationLink{
                        LogIn()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        
                        Text("Sign Out")
                            .foregroundColor(Color(.white))
                            .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
                        Image("login")
                            .resizable()
                            .frame(width: 14,height: 15)
                    }
                    
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width-30, height: 40)
            }
            .background(Color.black)
            .cornerRadius(15)
            //     .padding(.top,100)
            Spacer()
            
            
            
            //DELETING ACCOUNT BUTTON
            
            Button{
                print("Deleting account")
            } label: {
                HStack{
                    NavigationLink{
                        HomeScreen()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        
                        Text("Delete Account")
                            .foregroundColor(Color(.white))
                            .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
                        Image("login")
                            .resizable()
                            .frame(width: 14,height: 15)
                    }
                    
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width-30, height: 40)
            }
            .background(Color.black)
            .cornerRadius(15)
            //     .padding(.top,100)
            Spacer()
            
            
            
            
            
            
            
            
            
            
            
        }
    }
}


struct NavBarPP: View {
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
                Image("profile-filled")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: 70)
            }
            })
        
        
        
        
        
        
        
        
        
    }
}
