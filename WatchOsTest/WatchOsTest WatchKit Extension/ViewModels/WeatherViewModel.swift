//
//  WeatherViewModel.swift
//  WatchOsTest WatchKit Extension
//
//  Created by Himshikhar Gayan on 20/11/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import SwiftUI
import Combine

class WeatherViewModel : ObservableObject {
    private var url : String = "https://api.carbonintensity.org.uk/intensity"
    var githubUrl : String = "https://api.github.com/search/users?q=hgayan7"
    @Published private(set) var weatherData = [Weather]()
    @Published private(set) var githubData = [User]()
    @Published private(set) var carbonData = [CarbonDataModel]()
    
    private var cancellable : Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    init() {
        do {
            self.fetchData()
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func fetchData(){
        let component = URLComponents(string: self.url)!
        var request = URLRequest(url: component.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: CarbonModel.self, decoder: JSONDecoder())
            .map{ $0.data }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.carbonData, on: self)
    }
}
