//
//  NoteClass.swift
//  ManlevDiary
//
//  Created by 이명경 on 08/01/2019.
//  Copyright © 2019 Manlev. All rights reserved.
//

import Foundation
import UIKit

class Note {
    var Category:Int = 0
    var ShowDate:Date = Date()  // Date to display
    var TimeStamp:Date = Date() // Created time
    var Title:String = String()
    var Contents:String = String()  // Should be replaced with a type that can hold various data
}

class Category {
    var Name:String = String()
    var Info:String = String()  // Might be replaced
    var Color:UIColor = UIColor()
    var Notes = Array<Note>()
}
