//
//  HomeScreen.swift
//  mAgI
//
//  Created by Zheng Taing on 2/11/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        Logo()
                        ForYou()
                            
                        ModelPreview()
                            .padding(.horizontal,50)
                        
                        
                        Text("Cartoons")
                            .font(.custom("Apple SD Gothic Neo Bold", size: 14.0))
                            .padding(.vertical, -2)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { index in
                                    CategoryView(text: String("cartoon\(index + 1)"))
                                }
                            }
                        }
                        
                        Text("Artists")
                            .font(.custom("Apple SD Gothic Neo Bold", size: 14.0))
                            .padding(.vertical, -2)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<5) { index in
                                    CategoryView(text: String("artist\(index + 1)"))
                                }
                            }
                        }
                        
                        Text("Movies")
                            .font(.custom("Apple SD Gothic Neo Bold", size: 14.0))
                            .padding(.vertical, -2)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { index in
                                    CategoryView(text: String("movie\(index + 1)"))
                                }
                            }
                        }
                    }
                    .padding(.horizontal,10)
                    Spacer()
                }
                
                //Custom NavBar
                HStack{
  
                    NavBar(){}
                    
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
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
    
    struct Logo: View {
        var body: some View {
            HStack(){
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 35)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical,-1)
                    .padding(.horizontal,1)
                Spacer()

            }
        }
    }
    
    struct ForYou: View {
        var body: some View {
            HStack{
                Text(User.MOCK_USER.username)
                //    CategoryView(text: String("cartoon\(index + 1)"))
                
                //    Text(User.MOCK_USER.username)
                    .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
                    .padding(.vertical,0)
                    .padding(.horizontal,10)
            }
            
        }
    }
    
    struct ModelPreview: View {
        var body: some View {
            VStack {
                Image("elsa_saying_hi")
                    .resizable()
                    .frame(width: 300,height: 520)
                    .cornerRadius(15.0)
                
                
                Text("@youngelsa_frozen2")
                    .font(.custom("Apple SD Gothic Neo Bold", size: 9.0))
                    .foregroundColor(Color(.white))
                    .padding(.vertical,-30)
                    
                
            }
         //   .padding(.horizontal)

        }
    }

    struct TitleCard: View {
        let image: Image
        let action:()-> Void
        //   let movie: String
        
        var body: some View {
            Button(action: action, label: {
                NavigationLink{
                    char_page_frozen()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    image
                        .resizable()
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                      //  .aspectRatio(contentMode: .fit)
                }
            })
        }
    }
    
    struct NavBar: View {
      //  let image: Image
        let action:()-> Void
   
        
        var body: some View {
            Button(action: action, label: {
                NavigationLink{
                    HomeScreen()
                        .navigationBarBackButtonHidden(true)
                    
                }label:{
                    Image("home-filled")
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
                    Image("profile")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: 70)
                }
                })
            
            
            
            
            
            
            
            
            
        }
    }
    
    struct CategoryView: View {
        let text: String
        var body: some View {
            HStack {
                TitleCard(image:Image(text)){}
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



