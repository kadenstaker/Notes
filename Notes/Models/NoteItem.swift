//
//  NoteClass.swift
//  Notes
//
//  Created by Kaden Staker on 8/24/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation

class NoteItem: Equatable, Codable {
    
    var bodyText: String
    
    init(bodyText: String) {
        self.bodyText = bodyText

    }
    
    static func ==(lhs: NoteItem, rhs: NoteItem) -> Bool {
        if lhs.bodyText != rhs.bodyText {return false}
        return true
    }
}
