//
//  mAgIApp.swift
//  mAgI
//
//  Created by Zheng Taing on 2/10/24.
//

import SwiftUI

@main
struct mAgIApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
