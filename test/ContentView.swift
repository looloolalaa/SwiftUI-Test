//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

enum SortBy: String, CaseIterable, Identifiable {
    case name
    case creation
    case modification
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State private var selected: SortBy = .modification
    
    var body: some View {
        VStack {
            Picker("you pick?", selection: $selected) {
                ForEach(SortBy.allCases) { sortBy in
                    Text(sortBy.rawValue)
                        .tag(sortBy)
                }
            }
            Text(selected.rawValue)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
