//
//  URL+Optional.swift
//  PllugNews
//
//  Created by Kovalyk Nazar on 5/13/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import Foundation

// -------------------------------------
// MARK: - URL + Optional
// -------------------------------------
extension URL {

    init?(optional string: String?) {
        guard let string = string else {
            return nil
        }
        self.init(string: string)
    }

}
