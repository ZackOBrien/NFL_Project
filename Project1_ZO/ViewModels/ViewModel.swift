//
//  ViewModel.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/30/22.
//

import Foundation

class ViewModel : ObservableObject{
    @Published var teams = [Team]()
    @Published var games = [Game]()
    @Published var stadiums = [Stadium]()
    
    init(){
        //used a function call instead of implementing the same code three times
        readJSONFile(json: "nfl2023-games", model: "game")
        readJSONFile(json: "nfl2023-stadiums", model: "stadium")
        readJSONFile(json: "nfl2023-teams", model: "team")
    }
    

    
    func readJSONFile(json: String, model: String){
        
        // 1. pathString
        let pathString = Bundle.main.path(forResource: "\(json)", ofType: "json")
        
        if let path = pathString{
            // 2. URL
            let url = URL(fileURLWithPath: path)
            // 3. Data object
            do{
                let data = try Data(contentsOf: url)
                // 4. json decoder
                let jsonDecoder = JSONDecoder()
                // 5. get json data
                //checks to see what the json being read is and what model to put the data in
                if model == "game"{
                    let jsonData = try jsonDecoder.decode([Game].self, from: data)
                    games = jsonData.self
                } else if model == "team"{
                    let jsonData = try jsonDecoder.decode([Team].self, from: data)
                    teams = jsonData.self
                } else if model == "stadium"{
                    let jsonData = try jsonDecoder.decode([Stadium].self, from: data)
                    stadiums = jsonData.self
                }
                
            } catch{
            }
        }else{
        }
        
    }
}
