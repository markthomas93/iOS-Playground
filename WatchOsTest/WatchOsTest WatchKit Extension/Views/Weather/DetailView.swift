//
//  DetailView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI

struct DetailView : View {
    @State var color = 0
    var body : some View {
            List {
                Section(header: Text("Daily").font(.system(size: 16))){
                    DetailViewRow(text: "Mon : 24/30")
                    DetailViewRow(text: "Tue : 24/30")
                    DetailViewRow(text: "Wed : 24/30")
                    DetailViewRow(text: "Thu : 24/30")

                }
        }
    }
}

struct DetailViewRow : View {
    @State var text : String = ""
    var body : some View {
        HStack {
            Text(text).font(.system(size: 14))
            Spacer()
            Image(systemName:"cloud.heavyrain.fill")
            .resizable()
                .frame(width: 20, height: 20, alignment: .center)
        }
    }
}
