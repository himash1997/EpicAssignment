//
//  APIService.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-07.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
