//
//  GithubViewModel.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import Combine
import SwiftyJSON

class GithubViewModel : ObservableObject {
    
    private var base_url = "https://api.github.com/"
    private var search_user_endpoint = "search/users"
    private var followers_endpoint = "users/hgayan7/followers"
    private var repos_endpoint = "users/hgayan7/repos"
    private var user_name = "hgayan7"
        
    @Published private(set) var users = [User]()
    @Published private(set) var followers : [Follower] = []
    @Published private(set) var repos : [Repo] = []
    
    private var githubCancellable : Cancellable? {
        didSet{ oldValue?.cancel() }
    }
    
    init(){
        do{
            searchUser()
            //fetchFollowers()
            //fetchRepos()
        }
    }
    
    deinit {
        githubCancellable?.cancel()
    }
    
    func searchUser() {
        var component = URLComponents(string: "\(base_url)\(search_user_endpoint)")!
        component.queryItems = [
            URLQueryItem(name: "q", value: self.user_name)
        ]
        var request = URLRequest(url: component.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        githubCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: UserSearchResponse.self, decoder: JSONDecoder())
            .map{ $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
        
    }
    
    func fetchFollowers() {
        let component = URLComponents(string: "\(base_url)\(followers_endpoint)")!
        var request = URLRequest(url: component.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
        pub = URLSession.shared.dataTaskPublisher(for: component.url!)
            .eraseToAnyPublisher()
        githubCancellable = pub?.sink(receiveCompletion: { (completion) in
            print(completion)
        }, receiveValue: { (dataFromNetwork,response) in
            let json = try! JSON(data: dataFromNetwork)
            DispatchQueue.main.async {
                self.followers = json.map({ Follower.init(json: $0.1) })
            }
        })
    }
    
    func fetchRepos() {
        let component = URLComponents(string: "\(base_url)\(repos_endpoint)")!
        var request = URLRequest(url: component.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
        pub = URLSession.shared.dataTaskPublisher(for: component.url!)
        .eraseToAnyPublisher()
        githubCancellable = pub?.sink(receiveCompletion: { (completion) in
            print(completion)
        }, receiveValue: { (dataFromNetwork,response) in
            let json = try! JSON(data: dataFromNetwork)
            DispatchQueue.main.async {
                self.repos = json.map({ Repo.init(json: $0.1) })
            }
        })
    }
}



