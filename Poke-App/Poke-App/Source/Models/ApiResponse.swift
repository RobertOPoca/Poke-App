//
//  ApiResponse.swift
//  Poke-App
//
//  Created by Roberto De la O Pocasangre on 24/10/22.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    let results: T
}
