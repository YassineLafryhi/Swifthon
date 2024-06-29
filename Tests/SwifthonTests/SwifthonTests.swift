//
//  SwifthonTests.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import XCTest
@testable import Swifthon

final class SwifthonTests: XCTestCase {
    func testOpen() async throws {
        let user = OS.getlogin()
        let path = "/Users/\(user)/Desktop/demo.txt"

        var f = Open(path, "a")!
        f.write("Now the file has more content !")
        f.close()

        f = Open(path, "r")!
        var content = f.read()
        f.close()
        
        XCTAssertTrue(content.contains("Now the file has more content !"))

        f = Open("/Users/\(user)/Desktop/demo.txt", "w")!
        f.write("This will overwrite the file !")
        f.close()

        f = Open(path, "r")!
        content = f.read()
        f.close()
        
        XCTAssertTrue(content.contains("This will overwrite the file !"))
        
        OS.remove(path)
    }

    func testRequestsAndJson() async throws {
        let semaphore = DispatchSemaphore(value: 0)

        let data = try await Requests.get("https://jsonplaceholder.typicode.com/todos")
        let json = try Json.loads(data)
        for item in json {
            print(item["title"])
        }

        semaphore.signal()
    }

    func testOS() async throws {
        print("Current Working Directory: \(OS.cwd)")
        OS.cwd = "/tmp"
        print("New Current Working Directory: \(OS.cwd)")
        print("Contents of /tmp: \(OS.listdir())")

        if let path = OS.getenv("PATH") {
            print("PATH: \(path)")
        }
        OS.setenv("MY_CUSTOM_VAR", value: "123")
        print("MY_CUSTOM_VAR: \(OS.getenv("MY_CUSTOM_VAR") ?? "Not Set")")
        OS.unsetenv("MY_CUSTOM_VAR")

        print("Current Process ID: \(OS.pid)")
    }
}
