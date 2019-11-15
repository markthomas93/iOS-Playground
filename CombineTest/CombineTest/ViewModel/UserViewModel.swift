//
//  UserViewModel.swift
//  CombineTest
//
//  Created by Himshikhar Gayan on 14/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import Combine

final class UserViewModel : ObservableObject {
    
    typealias Users = [User]
    private var searchUserEndpoint: String = "https://api.github.com/search/users"
    @Published private(set) var userId: String = "hgayan7"
    @Published private(set) var githubUsers = [User]()
    
    private var cancellable : Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    init() {
        do {
            self.searchGithubUser()
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func searchGithubUser() {

        var urlComponents = URLComponents(string: self.searchUserEndpoint)!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: userId)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: GithubUserSeearchResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
//            .sink(receiveValue: { (user) in
//                self.githubUsers = user
//            })
            .assign(to: \.githubUsers, on: self)
    }
   
}
