//
//  FollowerView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct FollowerView : View{
    @State var model : GithubViewModel
    
    var body : some View {
        VStack{
            Text("Followers : \(model.followers.count)")
            List{
                ForEach(0..<model.followers.count){ index in
                    FollowerRow(follower: self.model.followers[index])
                }
                }.navigationBarTitle("Followers")
        }
           
    }
}

struct FollowerRow : View{
    @State var follower : Follower
    var body : some View {
        HStack{
            KFImage(URL(string: follower.avatar_url))
            .resizable()
            .clipShape(Circle())
            .frame(width: 20, height: 20, alignment: .leading)
            .padding(EdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 20))
            .overlay(
                    Circle().stroke(Color.red, lineWidth: 0.5)
            )
            Text(follower.login)
            .font(.system(size: 14))
        }
    }
}
