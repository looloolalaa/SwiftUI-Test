//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct Temp {
    var title: String
    var content: String
    var creationDate: Date
}

struct ContentView: View {
    @State private var temps: [Temp] = []
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("name", text: $text)
                .frame(width: 100)
            
            Button("write") {
                let fileManager = FileManager()
                let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                let newTextFileURL = documentURL.appendingPathComponent(text)
                
                do {
                    try text.write(to: newTextFileURL, atomically: false, encoding: .utf8)
                } catch {
                    print("Error File Write: \(error.localizedDescription)")
                }
            }
            
            Button("read") {
                let fileManager = FileManager()
                let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                
                do {
                    let allTextFileURLs = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
                    
                    for url in allTextFileURLs {
                        let title = url.lastPathComponent
                        let content = try String(contentsOf: url, encoding: .utf8)
                        
                        let attr = try fileManager.attributesOfItem(atPath: url.path)
                        let creationDate = attr[FileAttributeKey.creationDate] as! Date
                        let newTemp = Temp(title: title, content: content, creationDate: creationDate)
                        temps.append(newTemp)
                    }
                    
                } catch {
                    print("Error Reading File: \(error.localizedDescription)")
                }
                
                temps.sort { $0.creationDate < $1.creationDate }
            }
            
            Button("print") {
                for temp in temps {
                    print("\(temp.title): \(temp.content) (\(temp.creationDate))")
                }
            }
            
            Button("move") {
                let fileManager = FileManager()
                let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                
                let text0URL = documentURL.appendingPathComponent("Text0")
                let destinationURL = documentURL.appendingPathComponent("dddd")
                
                do {
                    try fileManager.moveItem(at: text0URL, to: destinationURL)
                } catch {
                    print("Error File Move: \(error.localizedDescription)")
                }
            }
            
            Button("all delete") {
                let fileManager = FileManager()
                let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                
                do {
                
                    let allFileURLs = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
                    for url in allFileURLs {
                        try fileManager.removeItem(at: url)
                    }
                    
                } catch {
                    print("Error Delete File: \(error.localizedDescription)")
                }
            }
            .foregroundStyle(.red)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
