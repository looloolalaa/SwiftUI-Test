//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI


struct ContentView: View {
    @State private var str = ""
    @State private var show = false
    @FocusState private var focus: Bool

    var body: some View {
//        NavigationView {
            VStack {
                if show {
                    TextField("test", text: $str)
                        .focused($focus)
                }
                Button("show & focus") {
                    show.toggle()
                    focus.toggle()
                }
            }
//        }
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
