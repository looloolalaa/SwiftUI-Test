//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct Temp {
    var a: Int
    var s: String
}

struct SecondView: View {
    @State private var str: String
    
    init(temp: Temp) {
        self.str = temp.s
//        self._str = State(initialValue: temp.s)
    }
    var body: some View {
        Text(str)
    }
}

struct ContentView: View {
    @State var temp = Temp(a: 4, s: "whatthe")
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(temp: temp)){
                    Text("Link")
                }
                
                Button("change") {
                    temp.s = "umm ..."
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
