//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct SearchRootView: View {
    
    @FocusState var focused: Field? // define here

    var body: some View {
        NavigationView {
            NavigationLink {
                SearchTextFieldPushView(focused: _focused) // pass down here
            } label: {
                Text("Search")
            }
        }
    }
}

enum Field {
    case name
}

struct SearchTextFieldPushView: View {
    
    @FocusState var focused: Field?
    
    @State var username: String = ""

    
    var body: some View {
        VStack {
            Button {
                focused = nil
            } label: {
                Text("Remove Focus")
            }
            
            Button("Focus") {
                focused = .name
            }
            
            if self.focused == nil {
                Text("No")
            } else {
                Text("Focus")
            }

            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextField("user name", text: $username)
                    .focused(self.$focused, equals: Field.name)
                    .disableAutocorrection(true)
                    .padding(4)
                    .border(.secondary)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView: View {
    @FocusState private var titleFieldFocused: Field?
//    @FocusState private var textFieldFocused: Bool
    
    @State private var title = "hello"
//    @State private var text = "ffff"
    
    var body: some View {
        SearchRootView()
//        VStack {
//            Text("hi")
//            if (titleFieldFocused != nil) {
//                Button("OK") {
//
//                }
//            }
//            TextField("title", text: $title)
//                .focused($titleFieldFocused, equals: .name)
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                TextField("title", text: $title)
//                    .focused($titleFieldFocused, equals: .name)
//            }
//        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
