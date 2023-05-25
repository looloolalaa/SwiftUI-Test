//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI

struct SecondView: View {
    @Binding var name: String
    var body: some View {
        VStack {
            Text(name)
            Button("change") {
                name = "ch"
            }
        }
    }
}

struct ContentView: View {
    @State var name: String = "we"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(name)
                NavigationLink(destination: SecondView(name: $name)) {
                    Text("link")
                }
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
