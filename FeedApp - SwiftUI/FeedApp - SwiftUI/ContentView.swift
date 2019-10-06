//
//  ContentView.swift
//  FeedApp - SwiftUI
//
//  Created by Himshikhar Gayan on 05/10/19.
//  Copyright © 2019 Himshikhar Gayan. All rights reserved.
//

import SwiftUI

struct Post : Identifiable {
    let id: Int
    let name, time, profileImageName, postImageName : String
}

struct ContentView: View {
    
    let posts : [Post] = [
    Post(id: 0, name: "Ram Kumar", time: "10 mins ago", profileImageName: "profilepic", postImageName: "pic1"),
    Post(id: 1, name: "Shyam Kumar", time: "7 mins ago", profileImageName: "profilepic", postImageName: "pic2"),
    Post(id: 2, name: "Dhyan Kumar", time: "10 mins ago", profileImageName: "profilepic", postImageName: "pic3"),
    Post(id: 3, name: "Shravan Kumar", time: "10 mins ago", profileImageName: "profilepic", postImageName: "pic4")
    ]
    
    var body: some View {
        NavigationView {
            List{
                VStack(alignment : .leading) {
                    Text("Trending").font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                                          VStack (alignment : .leading) {
                                                   HStack {
                                                            GroupView()
                                                            GroupView()
                                                            GroupView()
                                                            GroupView()
                                                            GroupView()
                                                            GroupView()

                                                   }
                                               }
                                   }.frame(height: 200)
                }
               
                ForEach(posts, id : \.id){ post in
                    NavigationLink(destination:PostView(post:post)){
                        PostView(post: post)
                    }
                }
                
                }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct GroupView : View {
    
    var body : some View {
        
                   VStack(alignment : .leading) {
                       Image("pic1")
                    .resizable()
                    .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(8)
                        
                       Text("Assam dog goes to America")
                           .lineLimit(nil)
                   }.frame(width : 100,height: 180)
                       .padding(.leading,0)
               }
}

struct PostView : View {
    
    let post : Post
    
    var body : some View {
        
        VStack (alignment : .leading) {
            HStack {
                Image(post.profileImageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
                VStack (alignment : .leading, spacing: 4) {
                    Text(post.name).font(.headline)
                    Text(post.time).font(.subheadline)
                }
            }.padding(.leading, 20).padding(.top,10)
            
            Text("A multiline text that will probably take multiple lines to show on screen")
                .lineLimit(nil)
                .padding(.leading,20).padding(.trailing,60)
            
            Image(post.postImageName)
            .resizable()
            .scaledToFill()
                .frame(height : 300)
            .clipped()
            
        }.padding(.leading, -20).padding(.bottom,-8).padding(.trailing,-20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
