//
//  NetworkManager.swift
//  CompletionHandler
//
//  Created by Mohamed Elkomey on 26/06/2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getUsers(completionHandler : @escaping ([User])->Void ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error in fetching data \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse ,response.statusCode == 200  else {
                print("invalid response")
                return
            }
            guard let data = data else {
                print("invalid data")
                return
            }

            if let users = try? JSONDecoder().decode([User].self, from: data){
                print(users)
                completionHandler(users)
            }
               
        }.resume()
    }
}
