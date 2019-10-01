//
//  PokeDex.swift
//  PokeDex
//
//  Created by Michael Di Cesare on 10/1/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import Foundation

//Top leve Dictionary
struct Pokemon: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case abilities
        case name
        case id
        case spritesDict = "sprites"
    }
    let id: Int
    let name: String
    let abilities: [AbilityDict]
    let spritesDict: SpritesDict

}
struct AbilityDict: Decodable {
    let ability: [Ability]
    
    struct Ability: Decodable {
            let name: String
    }
}

struct SpritesDict: Decodable {
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
    let image: URL
}
