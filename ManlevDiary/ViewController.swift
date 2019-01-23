//
//  ViewController.swift
//  ManlevDiary
//
//  Created by 이명경 on 2018. 10. 16..
//  Copyright © 2018년 Manlev. All rights reserved.
//

import UIKit
import FSCalendar
import FMDB

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // get database path
        let dbPath : String
        do {
            dbPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Kankani.sqlite").path
        } catch {
            print("Unable to get database path")
            return
        }

        // open database and create db and tables if db does not exists
        if !FileManager.default.fileExists(atPath: dbPath) {
            let kankaniDB = FMDatabase(path: dbPath)
            if kankaniDB.open() {
                let categoriesTableCreateSql = "CREATE TABLE IF NOT EXISTS categories(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)"
                let notesTableCreateSql = "CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, category INTEGER NOT NULL, title TEXT NOT NULL, contents TEXT, showDate TEXT, createdDate TEXT, FOREIGN KEY (category) REFERENCES categories(id)"
                if !(kankaniDB.executeStatements(categoriesTableCreateSql) || !(kankaniDB.executeStatements(notesTableCreateSql))) {
                    print("Failed to create tables : \(kankaniDB.lastErrorMessage())")
                } else {
                    print("Created categories and notes table to Kankani.sqlite")
                }
                kankaniDB.close()
            } else {
                print("Failed to open DB : \(kankaniDB.lastErrorMessage())")
            }
        }
    }
}
