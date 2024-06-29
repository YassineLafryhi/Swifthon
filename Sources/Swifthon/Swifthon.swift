//
//  Swifthon.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

public enum Swifthon {
    public typealias os = OS
    public typealias json = Json
    public typealias requests = Requests
    public typealias datetime = DateTime
    public typealias math = Math

    public static func open(_ path: String, _ mode: String) -> Open? {
        Open(path, mode)
    }
}
