//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI


struct SecondView: View {
    // SecondView only executes a given function
    // Even function that will change FirstView
    let fun: () -> ()
    

    var body: some View {
        Text("Func Executed")
            .onAppear {
                fun()
            }
    }
}


struct FirstView: View {
    @State var a = 0
    @State var b = 4444

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(fun: self.swap)) {
                    Text("swap link")
                }
                NavigationLink(destination: SecondView(fun: self.minusA)) {
                    Text("minusA link")
                }
                
                Button("plus b") { b += 1 }
                
                Text("\(a) \(b)")
            }
        }
    }
    
    func swap() {
        (a, b) = (b, a)
    }
    
    func minusA() {
        a -= 1
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
