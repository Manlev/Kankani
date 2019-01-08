//
//  SQLiteDatabase.swift
//  ManlevDiary
//
//  Created by Joowon Cheong on 2019. 1. 8..
//  Copyright © 2019년 Manlev. All rights reserved.
//

import Foundation
import SQLite3

// custom Error with error message
enum SQLiteError: Error {
    case OpenDatabase(message: String)
    case Prepare(message: String)
    case Step(message: String)
    case Bind(message: String)
}

protocol SQLTable {
    static var createStatement: String { get }
}

// wrap database connection pointers
class SQLiteDatabase {
    fileprivate let dbPointer: OpaquePointer?

    // wrap error message from sqlite
    internal var errorMessage: String {
        if let errorPointer = sqlite3_errmsg(dbPointer) {
            let errorMessage = String(cString: errorPointer)
            return errorMessage
        } else {
            return "No error message provided from sqlite"
        }
    }

    fileprivate init(dbPointer: OpaquePointer?) {
        self.dbPointer = dbPointer
    }

    deinit {
        sqlite3_close(dbPointer)
    }

    // static method returning SQLiteDatabase instance
    static func open(path: String) throws -> SQLiteDatabase {
        var db: OpaquePointer? = nil

        if sqlite3_open(path, &db) == SQLITE_OK {
            return SQLiteDatabase(dbPointer: db)
        } else {
            defer {
                if db != nil {
                    sqlite3_close(db)
                }
            }
        }

        if let errorPointer = sqlite3_errmsg(db) {
            let message = String.init(cString: errorPointer)
            throw SQLiteError.OpenDatabase(message: message)
        } else {
            throw SQLiteError.OpenDatabase(message: "No error message provided from sqlite")
        }
    }

    func prepareStatement(sql: String) throws -> OpaquePointer? {
        var statement: OpaquePointer? = nil
        guard sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.Prepare(message: errorMessage)
        }

        return statement
    }

    func createTable(table: SQLTable.Type) throws {
        let createTableStatement = try prepareStatement(sql: table.createStatement)
        defer {
            sqlite3_finalize(createTableStatement)
        }
        guard sqlite3_step(createTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("\(table) table created")
    }
}
