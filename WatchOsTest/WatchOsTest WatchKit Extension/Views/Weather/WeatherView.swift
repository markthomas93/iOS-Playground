//
//  WeatherView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct WeatherView : View {
    @State var isActive : Bool = false
    @ObservedObject var weatherModel : WeatherViewModel = WeatherViewModel()
    var body : some View {
        GeometryReader { geometry in
        VStack (spacing : 10){
            HStack {
                Text("Weather").font(.headline)
                .foregroundColor(Color.gray)
                    .padding(.leading,10)
                Spacer()
                NavigationLink(destination: SettingsView(location: "Ghy", isSound: true, isVibrate: true)) {
                    Image(systemName: "pencil.tip.crop.circle")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                }.frame(width: 20, height: 20, alignment: .center)
                .padding(.trailing,10)
            }
                Divider()
            HStack{
                NavigationLink(destination: LocationView()) {
                    Image(systemName: "cloud.heavyrain.fill")
                    .resizable()
                    .frame(width: geometry.size.width/3, height: geometry.size.height/3, alignment: .center)
                }.padding(EdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                Text(self.weatherModel.carbonData.first?.intensity.index ?? "Loading").font(.system(size: 16))
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 5))
            }
            NavigationLink(destination: DetailView(color: 0), isActive: self.$isActive) {
                ButtonView()
            }.frame(width: geometry.size.width/1.5, height: geometry.size.height/3, alignment: .center)
                .padding(EdgeInsets.init(top: 10, leading: 0, bottom: 0, trailing: 0))
            }.frame(width: geometry.size.width , height: geometry.size.height, alignment: .top)
            .padding(.top,5)
        }
    }
}
