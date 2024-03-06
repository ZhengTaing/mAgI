//
//  char_page_frozen_anna_video_call.swift
//  mAgI
//
//  Created by Zheng Taing on 2/23/24.
//

import SwiftUI

struct char_page_frozen_anna_message: View {
    var body: some View {
        VStack {
            Text("Message")
        }
        .onAppear{
            Task {
               let api =  ChatGPTAPI(apiKey: "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")
                do {
                  //  let stream = try await api.sendMessageStream(text: "Who is BLACKPINK?")
                  //  for try await line in stream{
                  //     print(line)
                    let text = try await api.sendMessage(text: "Who is blackpink ")
                    print(text)
                    Text(streamText)
                    
                    
                }catch{
                    print(error.localizedDescription)

                }
            }
        }

    }
}

#Preview {
    char_page_frozen_anna_message()
}
