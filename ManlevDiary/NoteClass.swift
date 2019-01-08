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
    var ShowDate:Date = Date()  // 노트에서 표시할 날짜
    var TimeStamp:Date = Date() // 노트 생성시각
    var Title:String = String()
    var Contents:String = String()  // 추후 다양한 데이터를 담을 수 있는 타입으로 변경 필요
}

class Category {
    var Name:String = String()
    var Info:String = String()  // 추후 타입 변경 가능성 있음
    var Color:UIColor = UIColor()
    var Notes = Array<Note>()
}
