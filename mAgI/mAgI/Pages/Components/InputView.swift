//
//  InputView.swift
//  mAgI
//
//  Created by Zheng Taing on 2/12/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .foregroundColor(Color(.black))
                .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
            
            if isSecureField{
                SecureField(placeholder, text: $text)
                    .font(.custom("Apple SD Gothic Neo Bold", size: 15.0))
            }else{
                TextField(placeholder, text: $text)
                    .font(.custom("Apple SD Gothic Neo Bold", size: 10.0))
            }
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
