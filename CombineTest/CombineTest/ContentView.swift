//
//  ContentView.swift
//  CombineTest
//
//  Created by Himshikhar Gayan on 14/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        NavigationView{
            ZStack{

                RoundedRectangle.init(cornerRadius: 6)
                    .foregroundColor(Color.yellow)
                    .frame(width: 300, height: 200, alignment: .top)
                
                VStack (alignment: .center) {
                    KFImage(URL(string: self.viewModel.githubUsers.first?.avatar_url ?? ""))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100,height: 100)
                                   Spacer().frame(height:10)
                                         HStack{
                                           Text("Username : ").font(.headline)
                                            Text(LocalizedStringKey.init(stringLiteral: self.viewModel.githubUsers.first?.login ?? "")).font(.subheadline)
                                         }
                                         Spacer().frame(height: 30)
                                         Button(
                                             action: {
                                                 self.viewModel.searchGithubUser()
                                             }, label: { Text("Search") }
                                             )
                               }.navigationBarTitle("Github Client")

            }
         }
    }
        }

struct HeaderView : View {
    var body : some View {
        Text("Profile")
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
