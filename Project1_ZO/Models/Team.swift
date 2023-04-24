//
//  Team.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/29/22.
//

import Foundation

struct Team : Identifiable, Decodable{
    var id = 0
    var name = ""
    var stadium = Stadium()
    var website = ""
    var logo = ""
}
