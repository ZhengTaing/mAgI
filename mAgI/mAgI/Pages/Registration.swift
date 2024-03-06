//
//  LogIn.swift
//  mAgI
//
//  Created by Zheng Taing on 2/12/24.
//

import SwiftUI

struct Registration: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var confirmPassword = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            VStack {
                //logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height:120)
                
                
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $userName,
                              title: "Username",
                              placeholder: "Enter your username")
                    .autocapitalization(.none)
                    
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password")
                    .autocapitalization(.none)
                    
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password")
                    .autocapitalization(.none)
                    
                }
                .padding(.horizontal,15)
                .padding(.top,100)
                //  Spacer()
                
                //Sign in button
                
                Button{
                    Task{
                        try await viewModel.createUser(withEmail: email, username: userName, password: password)
                    }
                } label: {
                    HStack{
                        NavigationLink{
                            HomeScreen()
                        }label: {
                            
                            Text("Sign Up")
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
                .padding(.top,100)
                Spacer()
                
                
                HStack(spacing: 5){
                    Text("Already have an account?")
                        .font(.custom("Apple SD Gothic Neo R", size: 12.0))
                        .foregroundColor(Color(.black))
                    NavigationLink{
                        LogIn()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Sign In !")
                            .font(.custom("Apple SD Gothic Neo Bold", size: 12.0))
                            .foregroundColor(Color(.black))
                    }
                    
                }
            }
            
        }
    }
    
    
    struct Registration_Previews: PreviewProvider {
        static var previews: some View {
            Registration()
        }
    }
}
