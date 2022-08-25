//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ["", ""]
    
    var body: some View {
        VStack {
            TextField("name", text: $text[0])
            TextField("name", text: $text[1])
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
