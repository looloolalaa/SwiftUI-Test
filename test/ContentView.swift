//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

enum Temp: String {
    case plus
    case minus
}


struct ContentView: View {
    let temp: Temp = .minus
    var body: some View {
        Text("hello")
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
