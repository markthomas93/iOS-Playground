//
//  SettingsView.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI

struct SettingsView : View {
    @State var location : String = ""
    @State var isSound : Bool = true
    @State var isVibrate : Bool = true
    var body : some View {
            Form{
                Section(header : Text("Notification").font(.system(size: 18))){
                    Toggle(isOn: $isSound){
                        Text("Sound")
                    }
                    Toggle(isOn: $isVibrate){
                        Text("Vibrate")
                    }
                }
               
            }.navigationBarTitle(Text("Settings"))
    }
}
