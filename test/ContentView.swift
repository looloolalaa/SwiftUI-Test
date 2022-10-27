//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI

struct SecondeView: View {
    @Binding var a: Int
    @Binding var b: Int
    @State private var i = 0

    var body: some View {
        Text("change")
            .task(takeTime)
    }
    
    func takeTime() async {
        while i < 1000000 {
            i += 1
        }
        b = 4
    }
}


struct ContentView: View {
    @State var a = 0
    @State var b = 1

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondeView(a: $a, b: $b)) {
                    Text("Link")
                }
                
                Text("\(a) \(b)")
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
