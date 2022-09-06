//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI



struct SecondView: View {
    @State var str: String
    
    init(str: String) {
        _str = State(initialValue: str)
    }
    var body: some View {
        Text(str)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView(str: "init")) {
                Text("Go")
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
