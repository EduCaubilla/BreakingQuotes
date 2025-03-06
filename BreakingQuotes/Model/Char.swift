//
//  Character.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

import Foundation

struct Char : Decodable {
    let name : String
    let birthday : String
    let occupations : [String]
    let images : [URL]
    let aliases : [String]
    let status : String
    let portrayedBy : String
    var death : Death?
    var productions : [String]
    
    enum CodingKeys: CodingKey {
        case name
        case birthday
        case occupations
        case images
        case aliases
        case status
        case portrayedBy
        case productions
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupations = try container.decode([String].self, forKey: .occupations)
        self.images = try container.decode([URL].self, forKey: .images)
        self.aliases = try container.decode([String].self, forKey: .aliases)
        self.status = try container.decode(String.self, forKey: .status)
        self.portrayedBy = try container.decode(String.self, forKey: .portrayedBy)
        self.productions = try container.decode([String].self, forKey: .productions)
        
        let deathDecoder = JSONDecoder()
        deathDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deathData = try Data(contentsOf: Bundle.main.url(forResource: "sampledeath", withExtension: "json")!)
        death = try deathDecoder.decode(Death.self, from: deathData)
    }
}
