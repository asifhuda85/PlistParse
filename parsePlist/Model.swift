//
//  Model.swift
//  parsePlist
//
//  Created by Md Asif Huda on 3/17/17.
//  Copyright © 2017 Md Asif Huda. All rights reserved.
//

import Foundation
class Model {
    
    var name = ""
    var image = ""
    
    init(json: [String: AnyObject]) {
        self.name = (json["name"] as? String)!
        self.image = (json["image"] as? String)!
    }
}
