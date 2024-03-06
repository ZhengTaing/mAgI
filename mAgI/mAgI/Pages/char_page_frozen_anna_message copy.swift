//
//  char_page_frozen_anna_message.swift
//  mAgI
//
//  Created by Zheng Taing on 2/23/24.
//

import SwiftUI
import OpenAISwift

struct char_page_frozen_anna_message: View {
    
    final class ViewModel: ObservableObject{
        init(){}
        
        private var client: OpenAISwift?
        
        func setup() {
           client = OpenAISwift(config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: "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"))


            
        }
    //    var client: OpenAISwift = OpenAISwift(config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: "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"))
        
        func send(text: String, completion: @escaping (String)-> Void){
            client?.sendCompletion(with: text, maxTokens: 500, completionHandler: {result in
                switch result{
                case.success(let model):
                    let output = model.choices?.first?.text ?? ""
                    completion(output)
                case .failure:
                    break
                }
            })
        }
    }

@ObservedObject var viewModel = ViewModel()
@State var text = ""
@State var models = [String]()
 
    var body: some View {
        

            VStack{
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 80, height: 80)
                    .padding(.vertical,10)
                
                Image("anna")
                    .resizable()
                    .frame(width:70, height:70)
                    .clipShape(Circle())
                    .padding(.vertical, -93)
                
                Text("@anna_frozen")
                    .font(.custom("Apple SD Gothic Neo Bold", size: 12.0))
                    .foregroundColor(Color(.black))
                    .padding(.vertical,-15)
                
                ScrollView{
                    //messages
                    VStack(alignment: .leading){
                        ForEach(models, id: \.self) {string in
                            Text(string)
                        }
                    }

                }
                
                HStack{
                    Button{
                        //sendmessage
                    }label:{
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 30, height: 25)
                            
                    }
                    .padding(.horizontal,4)
                    
                    TextField("mAgI", text: $text)
                        .font(.custom("Apple SD Gothic Neo Bold", size: 12.0))
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(25)
                        .onSubmit {
                            viewModel.setup()
                        }
                    Button{
                        //sendmessage
                        send()
                    }label:{
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                .padding(.horizontal,30)
                

            }
            .onAppear{
                viewModel.setup()
            }
       
     
        
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        models.append("@zhengtaing: \(text)")
        viewModel.send(text: text){response in
            DispatchQueue.main.async{
                self.models.append("@anna_frozen: " + response)
                
                self.text = ""
            }
        }
    }
}

#Preview {
    char_page_frozen_anna_message()
}
