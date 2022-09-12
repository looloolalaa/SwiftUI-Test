//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

class Temp: ObservableObject {
    @Published var items: [String] = ["0", "1", "wow"]
}


struct ContentView: View {
    @ObservedObject var temp: Temp
    
    @State private var str: String
    
    init(temp: Temp) {
        self.temp = temp
//        self.str = temp.items[1]
        do {
            //should be here
            let fileManager = FileManager()
            let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let textsURL = documentURL.appendingPathComponent("texts")
            let textURL = textsURL.appendingPathComponent("newFileName")

            try "zz".write(to: textURL, atomically: false, encoding: .utf8)
            
            
            self.str = "ddd"
        } catch {
            print("zz: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            Text(str)
            Button("plus") {
                str += "z"
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(temp: Temp())
    }
}
