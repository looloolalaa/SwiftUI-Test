//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

enum Temp: String {
    case plus
    case minusx
}


struct ContentView: View {
    let temp: Temp = Temp(rawValue: "plus")!
    var body: some View {
        Text("hello")
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
