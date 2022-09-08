//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("hello")
                .navigationTitle(Text("what"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
