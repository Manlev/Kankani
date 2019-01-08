//
//  ViewController.swift
//  ManlevDiary
//
//  Created by 이명경 on 2018. 10. 16..
//  Copyright © 2018년 Manlev. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // getting database path
        let dbPath:String
        do {
            dbPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Kankani.sqlite").path
        } catch {
            print("Unable to get database path")
            return
        }

        // open database
        let db: SQLiteDatabase
        do {
            db = try SQLiteDatabase.open(path: dbPath)
            print("Successfully opened connection to database.")
        } catch SQLiteError.OpenDatabase(let message) {
            print("Unable to open database. \(message)")
            return
        } catch {
            print("Unknown Error. \(error)")
            return
        }
    }
}

