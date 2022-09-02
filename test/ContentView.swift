//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct ContentView: View {
    @State private var sortBy = "creation"
    let types = ["name", "creation", "modification"]
    var body: some View {
        List {
            Picker("your pick?", selection: $sortBy) {
                ForEach(types, id: \.self) { type in
                    Text(type)
                }
            }
            .pickerStyle(.inline)
            Text(sortBy)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
