//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //no stroke
            Button(action: {

            }) {
                Text("hello my name is")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(.red)
                    .clipShape(Capsule())
            }
            
            //no background
            Button(action: {
                print("Hello button tapped!")
            }) {
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 45)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
            
            //All Yes
            Button(action: {
                print("sign up bin tapped")
            }) {
                Text("SIGN UP")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 5)
                    )
            }
            .background(Color.yellow) // If you have this
            .cornerRadius(25)         // You also need the cornerRadius here
            
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
