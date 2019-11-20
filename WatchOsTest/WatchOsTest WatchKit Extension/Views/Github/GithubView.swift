//
//  GithubView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct GithubView : View {
    @ObservedObject var githubModel : GithubViewModel = GithubViewModel()

    var body : some View {
        ScrollView{
            
            KFImage(URL(string: githubModel.users.first?.avatar_url ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
                .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.green, lineWidth: 0.5)
                )
            Text(githubModel.users.first?.login ?? "Loading")
            NavigationLink(destination: FollowerView(model: self.githubModel)){
                Button(action: {
                    self.githubModel.fetchFollowers()
                }) {
                    Text("Followers").frame(width: 100, height: 20, alignment: .center).foregroundColor(Color.green)
                }
            }
            NavigationLink(destination: RepoView(repos: self.githubModel.repos.sorted(by: { (repo1, repo2) -> Bool in
                return repo1.stargazers_count > repo2.stargazers_count
            }))){
                Button(action: {
                    self.githubModel.fetchRepos()
                }) {
                    Text("Repos").frame(width: 100, height: 20, alignment: .center).foregroundColor(Color.green)
                }
            }
            }.navigationBarTitle("GClient")
    }
}
