//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

struct ContentView: View {
    var body: some View {
        Button("check") {
            do {
                try checkPassword("password")
                print("Good")
            } catch {
                print("Error!")
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
