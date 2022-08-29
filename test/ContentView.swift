//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct SecondView: View {
    @State private var text = ""
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            if focused {
                Text("Focused!")
            } else {
                Text("Not Focused..")
            }
            
            
            Button("remove focus") {
                focused = false
            }.foregroundStyle(.red)
            
            TextField("empty", text: $text)
                .focused($focused)
                .border(.secondary)
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextField("empty", text: $text)
                    .focused($focused)
                    .border(.secondary)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SecondView()) {
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
