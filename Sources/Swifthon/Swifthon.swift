//
//  Swifthon.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

public enum Swifthon {
    typealias os = OS
    typealias json = Json
    typealias requests = Requests
    typealias datetime = DateTime

    public static func open(_ path: String, _ mode: String) -> Open? {
        Open(path, mode)
    }
}
