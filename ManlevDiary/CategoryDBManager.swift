//
//  CategoryDBManager.swift
//  ManlevDiary
//
//  Created by Joowon Cheong on 2019. 1. 8..
//  Copyright © 2019년 Manlev. All rights reserved.
//

import Foundation

struct Categories {
    let id: Int32
    let name: String
}

extension Categories: SQLTable {
        static var createStatement: String {
            return """
            CREATE TABLE IF NOT EXISTS Categories (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                color INTEGER
            );
            """
        }
}

class CategoryDBManager {
    private func createNote() {
    }
    
    private func readNote() {
    }
    
    private func updateNote() {
    }
    
    private func deleteNote() {
    }
}
