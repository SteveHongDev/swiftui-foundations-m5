//
//  ContentModel.swift
//  my-learning-app
//
//  Created by 홍성범 on 2022/02/17.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
    func getLocalData() {
        
        // get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // read the file into a data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("data.json parsing error")
        }
        
        // parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print("style.html parsing error")
        }
        
    }
}
