//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

class Temp: ObservableObject {
    @Published var items: [String] = ["bbc", "add", "c"]
    
    func sorting() {
        withAnimation {
            items.sort()
        }
    }
}

struct ContentView: View {
    @StateObject var temp = Temp()
    var body: some View {
        VStack {
            ForEach(temp.items, id: \.self) { item in
                Text(item)
            }
            
            Button("sorting") {
                temp.sorting()

            }
        }
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
