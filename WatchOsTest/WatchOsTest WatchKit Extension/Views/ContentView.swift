//
//  ContentView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 18/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: GithubView()){
                Text("Github")
            }
            NavigationLink(destination: WeatherView()){
                Text("Weather")
            }
        }.navigationBarTitle("GW")
    }
}

struct ButtonView : View {
    var body : some View {
        Text("Show All").font(.system(size: 14))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GithubView()
            WeatherView()
//            ContentView().previewDevice(PreviewDevice(rawValue: "Apple Watch Series 3 - 38mm"))
//            .previewDisplayName("Apple Watch Series 3 - 38mm")
//            ContentView().previewDevice(PreviewDevice(rawValue: "Apple Watch Series 4 - 44mm"))
//                       .previewDisplayName("Apple Watch Series 4 - 44mm")
            
        }
        }
}

