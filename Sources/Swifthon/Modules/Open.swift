//
//  Open.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public class Open {
    private var fileHandle: FileHandle?
    private let filePath: String
    private let fileMode: String

    init?(_ path: String, _ mode: String) {
        let fileManager = FileManager.default
        filePath = path
        fileMode = mode

        switch mode {
        case "a":
            if fileManager.fileExists(atPath: filePath) {
                do {
                    fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: filePath))
                    fileHandle?.seekToEndOfFile()
                } catch {
                    print("Failed to open file for appending: \(error)")
                    return nil
                }
            } else {
                fileManager.createFile(atPath: filePath, contents: nil)
                do {
                    fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: filePath))
                } catch {
                    print("Failed to create and open file for appending: \(error)")
                    return nil
                }
            }
        case "w":
            fileManager.createFile(atPath: filePath, contents: nil)
            do {
                fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: filePath))
            } catch {
                print("Failed to open file for writing: \(error)")
                return nil
            }
        case "r":
            if fileManager.fileExists(atPath: filePath) {
                do {
                    fileHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: filePath))
                } catch {
                    print("Failed to open file for reading: \(error)")
                    return nil
                }
            } else {
                print("File does not exist: \(filePath)")
                return nil
            }
        default:
            print("Unsupported file mode: \(mode). Use 'a' for append or 'w' for write.")
            return nil
        }
    }

    public func write(_ content: String) {
        if let data = content.data(using: .utf8) {
            fileHandle?.write(data)
        }
    }

    public func read() -> String {
        guard fileMode == "r" else {
            print("File not opened in read mode")
            return ""
        }

        if let data = fileHandle?.readDataToEndOfFile() {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }

    public func close() {
        fileHandle?.closeFile()
    }
}
