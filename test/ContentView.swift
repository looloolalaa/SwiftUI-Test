//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI


struct ContentView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
                print("zz")
            }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
