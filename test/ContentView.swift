//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct ContentView: View {
    @State private var showing = false
    
    var body: some View {
        VStack {
            if showing {
                Image(systemName: "moon")
                    .transition(.slide)
            }
            
            Button("toggle") {
                withAnimation {
                    showing.toggle()
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
