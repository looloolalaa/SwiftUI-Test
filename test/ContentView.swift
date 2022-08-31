//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
