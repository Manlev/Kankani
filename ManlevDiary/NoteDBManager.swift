//
//  NoteDBManager.swift
//  ManlevDiary
//
//  Created by Joowon Cheong on 2019. 1. 8..
//  Copyright © 2019년 Manlev. All rights reserved.
//

import Foundation

struct Notes {
    let id: Int32
    let category: Int32
    let title: String
    let contents: String
    let showDate: Date
    let timeStamp: Date
}

extension Notes: SQLTable {
    static var createStatement: String {
        return """
        CREATE TABLE IF NOT EXISTS Notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            CONSTRAINT category FOREIGN KEY(id) REFERENCES Categories(id),
            title TEXT,
            content TEXT,
            showDate DATE,
            timeStamp DATE
        );
        """
    }
}

class NoteDBManager {
    private func createNote() {
    }

    private func readNote() {
    }

    private func updateNote() {
    }

    private func deleteNote() {
    }
}
