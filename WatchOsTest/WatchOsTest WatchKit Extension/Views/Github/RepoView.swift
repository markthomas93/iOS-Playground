//
//  RepoView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct RepoView : View {
    @State var repos : [Repo]
    var body : some View {
        List{
            ForEach(0..<repos.count){ index in
                Group{
                VStack{
                    Text(self.repos[index].name).lineLimit(3)
                }
                    RepoStatsRow(repo: self.repos[index])
                }
            }
        }.navigationBarTitle("Repos")
    }
}

struct RepoStatsRow : View {
    @State var repo : Repo
    var body: some View {
        HStack{
            Image(systemName: "star.circle.fill")
            .resizable()
                .frame(width: 20, height: 20, alignment: .topLeading)
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            Text("\(self.repo.stargazers_count)")
            Spacer()
            Image(systemName: "tuningfork")
            .resizable()
                .frame(width: 20, height: 20, alignment: .topLeading)
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            Text("\(self.repo.forks)")
        }
    }
}
