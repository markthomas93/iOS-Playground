//
//  WeatherModels.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct WeatherModel : Decodable{
    var weather : [Weather]
}

struct Weather : Decodable, Identifiable, Hashable {
    var id : Int
    var main : String
    var description : String
}

struct CarbonModel : Decodable {
    var data : [CarbonDataModel]
}
struct CarbonDataModel : Decodable, Hashable {
    var from : String
    var to : String
    var intensity : CarbonIntensity
}

struct CarbonIntensity : Decodable, Hashable {
    var forecast : Int
    var actual : Int
    var index : String
}
