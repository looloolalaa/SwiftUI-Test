//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct Temp {
    var a: Int
    var s: String
}

struct ContentView: View {
    @State var temp: Temp = Temp(a: 4, s: "hi") {
        willSet(newTemp) {
            print("wow! \(temp.s) -> \(newTemp.s)")
        }
    }
    var body: some View {
        Button("change") {
            temp = Temp(a: 0, s: "is this right?")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
