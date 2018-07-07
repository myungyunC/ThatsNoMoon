//
//  Actor.swift
//  ThatsNoMoon
//
//  Created by Chung, Myungyun on 7/7/18.
//  Copyright © 2018 Chung, Myungyun. All rights reserved.
//

import UIKit

class Results: Codable {
    let results: [Character]
    
    init(results: [Character]) {
        self.results = results
    }
}


class Character: Codable {
    let name: String
    let homeworld: URL

    
    init(name: String, homeworld: URL) {
        self.name = name
        self.homeworld = homeworld
    }
}


