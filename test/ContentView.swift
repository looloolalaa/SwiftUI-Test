//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

class Temp {
    var tof: Bool = false
}


struct ContentView: View {
    var temp = Temp()
    
    var body: some View {
        VStack {
            Button("toggle") {
                temp.tof.toggle()
            }
            
            if temp.tof {
                Text("true!")
            } else {
                Text("false ..")
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
