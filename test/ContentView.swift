//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

class Memos: ObservableObject {
    @Published var items: [String] = ["0","4","3"]
}

struct ThirdView: View {
    @ObservedObject var memos: Memos
    var body: some View {
        VStack {
            HStack {
                ForEach(memos.items, id: \.self) { item in
                    Text(item)
                }
            }
            
            Button("change") {
                memos.items[2] = "wow!"
            }
        }
    }
}

struct SecondView: View {
    @ObservedObject var memos: Memos
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(memos.items, id: \.self) { item in
                        Text(item)
                    }
                }
                NavigationLink(destination: ThirdView(memos: memos)) {
                    Text("Go")
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject var memos: Memos = Memos()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(memos.items, id: \.self) { item in
                        Text(item)
                    }
                }
                NavigationLink(destination: SecondView(memos: memos)) {
                    Text("Go")
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
