//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

class Temps: ObservableObject {
    @Published var items: [Temp] = [
        Temp(s: "aaa"),
        Temp(s: "Second")
    ]
}

struct Temp: Identifiable, Equatable {
    var id = UUID()
    var s: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}


struct ContentView: View {
    @StateObject var temps = Temps()
    var body: some View {
        VStack {
            ForEach(temps.items) { temp in
                Text(temp.id.description)
                Text(temp.s)
            }
            Button("change") {
                temps.items[1].s = "plz"
            }
        }
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
