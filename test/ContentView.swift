//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.

import SwiftUI

struct SecondView: View {
    let action: () -> ()
    var body: some View {
        Button("image click") {
            action()
        }
    }
}


struct ContentView: View {
    @State var timeRemaining = -1
    @State private var showingProgress: Bool = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        NavigationView {
            VStack {
                if showingProgress {
                    ProgressView()
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            }
                            
                            if timeRemaining == 0 {
                                close()
                            }
                        }
                }
                
                NavigationLink(destination: SecondView(action: { timeRemaining = 5 })) {
                    Text("Link")
                }
                    
            }
        }
        
    }
    
    func close() {
        showingProgress = false
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
