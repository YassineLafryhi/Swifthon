//
//  Requests.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum Requests {
    public static func get(_ urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
