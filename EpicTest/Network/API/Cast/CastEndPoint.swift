//
//  CastEndPoint.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-07.
//

import Foundation

enum CastEndPoint {
    case castList(Int)
}

extension CastEndPoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .castList(let limit):
            guard let url = URL(string: "https://www.breakingbadapi.com/api/characters?limit=5")
            else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            //request.setValue("5", forHTTPHeaderField: "limit")
            return request
            
        }
    }
}

//https://www.breakingbadapi.com/api/characters?limit=5
