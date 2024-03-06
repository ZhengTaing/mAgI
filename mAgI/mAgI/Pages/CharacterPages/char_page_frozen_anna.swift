//
//  char_page_frozen_elsa.swift
//  mAgI
//
//  Created by Zheng Taing on 2/22/24.
//

import SwiftUI

struct char_page_frozen_anna: View {
    var body: some View {
        ZStack {
            VStack{
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 120, height: 120)
                
                Image("anna")
                    .resizable()
                    .frame(width:120, height:110)
                    .clipShape(Circle())
                    .padding(.vertical, -123)
                
                Text("@anna_frozen")
                    .font(.custom("Apple SD Gothic Neo Bold", size: 12.0))
                    .foregroundColor(Color(.black))
                    .padding(.vertical,2)
                
                
                
                HStack {
                    
                    Button(action: {}, label: {
                        NavigationLink{
                            char_page_frozen_anna_call()
                        }label: {
                            Image("call")
                                .resizable()
                                .frame(width:30, height:30)
               
                                .padding(.horizontal,40)
                            
              
                        }
                    })
                    
                    
                    Button(action: {}, label: {
                        NavigationLink{
                            char_page_frozen_anna_message()
                        }label: {
                            Image("message")
                                .resizable()
                                .frame(width:31, height:30)
                 
                                .padding(.horizontal,40)

                        }
                    })
                    
                    
                    Button(action: {}, label: {
                        NavigationLink{
                            char_page_frozen_anna_video_call()
                        }label: {
                            Image("video_call")
                                .resizable()
                                .frame(width:31, height:30)
                    
                                .padding(.horizontal,40)

                        }
                    })
                    

                }.padding(.vertical,35)
                
                
                
                
                
                
                
                
            }
        }
        .padding(.vertical,80)
        Spacer()
        
    }
    
}














#Preview {
    char_page_frozen_anna()
}
