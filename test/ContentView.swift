//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct Temp: Hashable {
    var name: String
    var content: String
}

class Temps: ObservableObject {
    @Published var items: [Temp] = [
        Temp(name: "first", content: "this is the first content"),
//        Temp(name: "second", content: "second content")
    ]
    
    func change() {
        items[0].content = "changed!"
    }
}

struct SecondView: View {
    @ObservedObject var temps: Temps
    var temp: Temp
    
    var body: some View {
        VStack {
            Text(temp.content)
            
            Button("change") {
                temps.change()
            }
        }
    }
}

struct ContentView: View {
    @StateObject var temps = Temps()
    
    var body: some View {
        NavigationView {
            VStack {
//                ForEach(temps.items, id: \.self) { item in
//                    NavigationLink(destination: SecondView(temps: temps, temp: item)) {
//                        Text(item.name)
//                    }
//                }
                NavigationLink(destination: SecondView(temps: temps, temp: temps.items[0])) {
                    Text(temps.items[0].name)
                }
//                NavigationLink(destination: SecondView(temps: temps, temp: temps.items[1])) {
//                    Text(temps.items[1].name)
//                }
            }
        }
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
