//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct TempImage: Identifiable {
    var id: Int
    var name: String
    var image: Image?
}

struct ContentView: View {
    let tempImages: [TempImage] = {
        let fileManager = FileManager()
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            let allFileURLs = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
            
            var tempImages: [TempImage] = []
            for (i, url) in allFileURLs.enumerated() {
                let name = url.lastPathComponent
                var image: Image?
                if let data = try? Data(contentsOf: url), let loaded = UIImage(data: data) {
                    image = Image(uiImage: loaded)
                } else {
                    image = nil
                }
                let tempImage = TempImage(id: i, name: name, image: image)
                tempImages.append(tempImage)
            }
            
            return tempImages
            
        } catch {
            print("Error Reading File: \(error.localizedDescription)")
        }
        
        return []
    }()
    
    var body: some View {
        VStack {
            HStack {
                Button("save") {
                    let newFileName = "부엉이"
                    let newFileContent = UIImage(imageLiteralResourceName: newFileName)
                    
                    let fileManager = FileManager()
                    let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let dataURL = documentURL.appendingPathComponent(newFileName)
                    
                    do {
                        let imageData = newFileContent.pngData()
                        if let _ = imageData {
                            print("not nil")
                        } else {
                            print("!nil!")
                        }
                        try imageData?.write(to: dataURL)
                    } catch {
                        print("Error Writing File: \(error.localizedDescription)")
                    }
                }
                
                Button("delete") {
                    let fileManager = FileManager()
                    let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                    do {
                        let allFileURLs = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
                        for url in allFileURLs {
                            try fileManager.removeItem(at: url)
                        }
                    } catch {
                        print("Error Deleting File: \(error.localizedDescription)")
                    }
                }
            }
            
            List {
                ForEach(tempImages) { item in
                    HStack {
                        Text(item.name)
                            .bold()
                        Divider()
                        item.image?
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                    }
                    
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
