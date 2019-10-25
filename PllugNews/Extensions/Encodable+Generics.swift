//
//  Codable+Encodable.swift
//  PllugNews
//
//  Created by Kovalyk Nazar on 5/13/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import Foundation

extension Encodable {

    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
}
