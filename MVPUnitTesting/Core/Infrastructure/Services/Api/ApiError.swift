//
//  ApiError.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/18/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case notFound
    case parseError
    case internalServerError
    case badRequest
    case invalidURL
    case noData
}
