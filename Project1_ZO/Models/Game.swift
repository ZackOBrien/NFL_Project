//
//  Game.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/31/22.
//

import Foundation

struct Game : Identifiable, Decodable{
    var id = 0
    var week = 0
    var date = Date()
    var location = Stadium()
    var awayteam = Team()
    var hometeam = Team()
    enum CodingKeys: String, CodingKey{
        case id, week, date, location
        case awayteam = "away-team"
        case hometeam = "home-team"
    }
}

