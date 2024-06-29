//
//  OS.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum OS {
    public static var cwd: String {
        get { FileManager.default.currentDirectoryPath }
        set { FileManager.default.changeCurrentDirectoryPath(newValue) }
    }

    public static func listdir(_ path: String? = nil) -> [String] {
        let path = path ?? FileManager.default.currentDirectoryPath
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            print("Error listing directory \(path): \(error)")
            return []
        }
    }

    public static func getenv(_ name: String) -> String? {
        ProcessInfo.processInfo.environment[name]
    }

    public static func setenv(_ name: String, value: String) {
        Darwin.setenv(name, value, 1)
    }

    public static func unsetenv(_ name: String) {
        Darwin.unsetenv(name)
    }

    public static func getlogin() -> String {
        let homeDirectory = NSHomeDirectory()
        let userName = homeDirectory.components(separatedBy: "/").last!
        return userName
    }

    public static var pid: Int {
        Int(ProcessInfo.processInfo.processIdentifier)
    }

    public static func mkdir(_ path: String) {
        do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
        } catch {
            print("Failed to create directory \(path): \(error)")
        }
    }

    public static func rename(_ oldPath: String, _ newPath: String) {
        do {
            try FileManager.default.moveItem(atPath: oldPath, toPath: newPath)
        } catch {
            print("Failed to rename \(oldPath) to \(newPath): \(error)")
        }
    }

    public static func remove(_ path: String) {
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch {
            print("Failed to delete \(path): \(error)")
        }
    }
}
