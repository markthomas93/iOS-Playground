//
//  GithubUser.swift
//  CombineTest
//
//  Created by Himshikhar Gayan on 14/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import UIKit

struct User : Identifiable, Decodable, Hashable {
    var id: Int
    var avatar_url : String
    var login : String
}
