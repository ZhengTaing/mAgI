//
//  ContentView.swift
//  mAgI
//
//  Created by Zheng Taing on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{

                LogIn()
                
            }
            
        }
    }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
    



