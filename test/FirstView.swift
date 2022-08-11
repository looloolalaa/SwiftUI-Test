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
    ]
    
    func change() {
        items[0].content = "changed!"
    }
}

struct SecondView: View {
    @ObservedObject var temps: Temps
    
    var body: some View {
        VStack {
            Text(temps.items[0].content)
            
            Button("change") {
                temps.change()
            }
        }
    }
}

struct FirstView: View {
    @StateObject var temps = Temps()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(temps.items.indices, id: \.self) { index in
                    NavigationLink(destination: SecondView(temps: temps)) {
                        Text(temps.items[index].name)
                    }
                }
            }
        }
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
