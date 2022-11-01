//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false
    @State private var showAlert: Bool = false
    @State var imageLoadTimeRemaining: Int = -1
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            
            if show {
                ProgressView()
            }
            
            Button("toggle") {
                withAnimation {
                    show = true
                }
                imageLoadTimeRemaining = 5
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("too long time"))
            }
            .onReceive(timer) { _ in
                if imageLoadTimeRemaining > 0 { imageLoadTimeRemaining -= 1 }
                if imageLoadTimeRemaining == 0 {
                    imageLoadTimeRemaining = -1
                    withAnimation {
                        show = false
                    }
                    showAlert = true
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
