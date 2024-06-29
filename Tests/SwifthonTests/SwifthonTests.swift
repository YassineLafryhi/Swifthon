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
        let user = Swifthon.os.getlogin()
        let path = "/Users/\(user)/Desktop/demo.txt"

        var f = Swifthon.open(path, "a")!
        f.write("Now the file has more content !")
        f.close()

        f = Swifthon.open(path, "r")!
        var content = f.read()
        f.close()

        XCTAssertTrue(content.contains("Now the file has more content !"))

        f = Swifthon.open("/Users/\(user)/Desktop/demo.txt", "w")!
        f.write("This will overwrite the file !")
        f.close()

        f = Swifthon.open(path, "r")!
        content = f.read()
        f.close()

        XCTAssertTrue(content.contains("This will overwrite the file !"))

        Swifthon.os.remove(path)
    }

    func testRequestsAndJson() async throws {
        let semaphore = DispatchSemaphore(value: 0)

        let data = try await Swifthon.requests.get("https://jsonplaceholder.typicode.com/todos")
        let json = try Swifthon.json.loads(data)
        for item in json {
            print(item["title"])
        }

        semaphore.signal()
    }

    func testOS() async throws {
        print("Current Working Directory: \(Swifthon.os.cwd)")
        Swifthon.os.cwd = "/tmp"
        print("New Current Working Directory: \(Swifthon.os.cwd)")
        print("Contents of /tmp: \(Swifthon.os.listdir())")

        if let path = Swifthon.os.getenv("PATH") {
            print("PATH: \(path)")
        }
        Swifthon.os.setenv("MY_CUSTOM_VAR", value: "123")
        print("MY_CUSTOM_VAR: \(Swifthon.os.getenv("MY_CUSTOM_VAR") ?? "Not Set")")
        Swifthon.os.unsetenv("MY_CUSTOM_VAR")

        print("Current Process ID: \(Swifthon.os.pid)")
    }

    func testDateTime() async throws {
        let now = Swifthon.datetime.now()
        let formatted = now.strftime("dd-MM-yyyy HH:mm:ss")
        print(formatted)
    }

    func testMath() async throws {
        print("Value of pi: \(Swifthon.math.pi)")
        print("Value of e: \(Swifthon.math.e)")

        print("Square root of 25: \(Swifthon.math.sqrt(25))")
        print("Factorial of 3: \(Swifthon.math.factorial(3))")
    }
}
