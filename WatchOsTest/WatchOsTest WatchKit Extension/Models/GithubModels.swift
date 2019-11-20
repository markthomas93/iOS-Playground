//
//  Models.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct UserSearchResponse : Decodable{
    var items : [User]
}

struct User : Decodable, Identifiable, Hashable{
    var id : Int
    var login : String
    var avatar_url : String
    var repos_url : String
}

struct Follower : Decodable {
    var login : String
    var avatar_url : String
    init(json : JSON){
        login = json["login"].stringValue
        avatar_url = json["avatar_url"].stringValue
    }
}

struct Repo : Decodable {
    var name: String
    var stargazers_count: Int
    var forks : Int
    init(json : JSON){
        name = json["name"].stringValue
        stargazers_count = json["stargazers_count"].intValue
        forks = json["forks"].intValue
    }
}
