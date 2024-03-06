//
//  ChatGPTAPI.swift
//  mAgI
//
//  Created by Zheng Taing on 3/6/24.
//

import Foundation

class ChatGPTAPI{
    
    private let apiKey: String
    private var historyList = [String]()
    private let urlSession = URLSession.shared                                                                   //for making API calls
    private var urlRequest: URLRequest{
        let url = URL(string: "https://api.openai.com/v1/completions")!                                          //force unwrappung the URL; assuming that URL is absolutely valid !!NOTSAFE better to use if else and handle invalid case
        var urlRequest = URLRequest(url: url)                                                                    //new object creation
        urlRequest.httpMethod = "POST"
        headers.forEach {(urlRequest.setValue($1, forHTTPHeaderField: $0))}                                      // $0 represents "Content-Type...." ; $1 represents "Authroization...."
        return urlRequest
    }
    
    private let jsonDecoder = JSONDecoder()                                                                      //JSONDecoder() decodes JSON data (fromv API) to be used in Swift data types such as struct or classes; openai is a json api
    
    private let basePrompt = "You are Princess Anna from Arendelle from the disney movie frozen. Keep the conversation engaging. \n\n\n"
    
    private var headers: [String: String]{
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
            
        ]
    }
    
    private var historyListText: String {
        historyList.joined()
    }
    
    
    init(apiKey: String){
        self.apiKey = apiKey
    }
    
    private func generateChatGPTPrompt(from text: String) -> String {
        var prompt = basePrompt + historyListText + "User: \(text)\n\n\nChatGPT:"
        if prompt.count > (4000 * 4){
            _ = historyList.dropFirst()
            prompt = generateChatGPTPrompt(from: text)                                                           //recursive call to the same function to keep prompt(conversation) going with character limits + chat history context
        }
        
        
        return prompt
    }
    
    private func jsonBody(text: String, stream: Bool = true) throws -> Data{                                     //we have to convert jsonBody(dictionary) into json data
        let jsonBody: [String: Any] = [
            "model" : "gpt-3.5-turbo",
            "temperature": 0.5,
            "max_tokens": 1024,
            "prompt": generateChatGPTPrompt(from: text),                                                         //from parameter
            "stop": [
                "\n\n\n",
                "<|im_end|>"
            ],
            "stream": stream
        ]
        //Throws out error if conversion fail
        return try JSONSerialization.data(withJSONObject: jsonBody)
        
    }
    
                                                                                
    func sendMessageStream(text: String) async throws -> AsyncThrowingStream<String, Error> {                    //AsyncThrowingStream typically used to stream responses fron API that produce a large results over time; this return stream of values
        var urlRequest = self.urlRequest                                                                         //
        urlRequest.httpBody = try jsonBody(text: text)                                                           //encoding user's text into JSON format
        
        
        
        //fetching response body byte into "result" and response into "response" ;
        //stream of bytes is expected to return ;
        //API Call
        //try  await is to wait til its done before execution; await result of operation rather than blocking it
        let (result, response) = try await urlSession.bytes(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {                                             //guard is usually used for early exits; in this case it check if the type matches ? Is repsonse a type httpResponse
            throw "Invalid response"
        }
        
        guard 200...299 ~= httpResponse.statusCode else {                                                        //check if statuscode of httpResponse is within range for e.g. 200 = success, 404 = not found, 500 = internal server error
            throw "Bad Response: \(httpResponse.statusCode)"
        }
        
        return AsyncThrowingStream<String, Error> { continuation in
            
            //creating a new asyncronous task with priority level; priority level chosen is .userInitiated
            // .userInitiated = responsive interactive
            // .background = background task without impacting user xp
            // . ultility = low priority
            // . default = no special treatment needed
    
            Task(priority: .userInitiated){
                do {
                    var streamText = ""
                    for try await line in result.lines{                                                          //loop through result/ sequence element as they become available
                        if line.hasPrefix("data: "),
                           let data = line.dropFirst(6).data(using: .utf8),                                      //dropping first 6 characters data:_
                           let response = try? self.jsonDecoder.decode(CompletionResponse.self, from: data),     //decoding data object into an instance of completionresponse
                           let text = response.choices.first?.text{                                              //if completionresponse exist, extract the first choice of the decoded data
                                
                            streamText += text
                            continuation.yield(text)                                                             //continuation is used to represent future completion of the async ooperation

                            
                        }
                    }
                    self.historyList.append(streamText)
                    continuation.finish()
                }catch{
                    continuation.finish(throwing: error)
                }
            }
            
            
        }
        
    }
    
    func sendMessage(text: String) async throws -> String {                                                       //Expects a string back
        var urlRequest = self.urlRequest
        urlRequest.httpBody = try jsonBody(text: text, stream: false)
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw "Invalid Response"
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw "Bad Response: \(httpResponse.statusCode)"
        }
        
        do {
            let completionResponse = try self.jsonDecoder.decode(CompletionResponse.self, from: data)
            let responseText = completionResponse.choices.first?.text ?? ""
            self.historyList.append(responseText)
            return responseText
        } catch {
            throw error
        }
        
    }
    
}

extension String: Error {}

struct CompletionResponse: Decodable{
    let choices: [Choice]
}

struct Choice: Decodable {
    let text: String
}
