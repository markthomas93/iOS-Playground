//
//  LocationView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI

struct LocationView : View {
    @State var location: String = "Enter location"
    var body : some View {
        VStack(alignment : .leading) {
            Text("Location")
            TextField("Enter location",text: $location)
        }.navigationBarTitle(Text("Location"))
    }
}
