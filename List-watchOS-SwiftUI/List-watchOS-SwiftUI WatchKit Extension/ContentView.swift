//
//  ContentView.swift
//  List-watchOS-SwiftUI WatchKit Extension
//
//  Created by Himshikhar Gayan on 13/10/19.
//

import SwiftUI

struct ListData {
    let id = UUID()
    let name : String
}

struct ContentView: View {
    
    @State var listData : [ListData] = [
        ListData(name:"India"),
        ListData(name:"Australia"),
        ListData(name:"Srilanka"),
        ListData(name:"Bhutan"),
        ListData(name:"England")
    ]
    
    var body: some View {
        VStack{
            Text("Countrypedia").font(.subheadline)
            Image("pic3")
                .resizable()
                .clipShape(Circle())
                .frame(width :40,height:40)
                .clipped()
            List {
                ForEach(listData,id : \.id) { row in
                    NavigationLink(destination : CountryDetailView(country: row)){
                        Text(row.name)
                    }
                }.onMove{ self.listData.move(fromOffsets: $0, toOffset: $1) }
                .onDelete{ self.listData.remove(atOffsets: $0) }
            }
        }
        
    }
}

struct CountryDetailView : View {
    let country : ListData
    var body : some View {
        Text(country.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
