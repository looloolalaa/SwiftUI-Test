//
//  testApp.swift
//  test
//
//  Created by Kihyun Lee on 2022/07/13.
//

import SwiftUI

@main
struct testApp: App {
    @StateObject var temp = Temp()
    var body: some Scene {
        WindowGroup {
            ContentView(temp: temp)
        }
    }
}
