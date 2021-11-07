//
//  APIError.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-07.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
