//
//  Json.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum Json {
    static func loads(_ data: Data) throws -> [[String: Any]] {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
            throw URLError(.cannotParseResponse)
        }
        return json
    }
}
