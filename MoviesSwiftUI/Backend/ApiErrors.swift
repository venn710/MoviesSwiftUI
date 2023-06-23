//
//  ApiErrors.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation

public enum ApiError:Error{
    case invalidUrl
    case invalidData
    case somethingWentWrong
}

extension ApiError:LocalizedError{
    public var errorDescription: String?{
        switch self {
        case .invalidData:
            return ApiErrorConstants.dataParsingError
        case .invalidUrl:
            return ApiErrorConstants.urlValidationError
        case .somethingWentWrong:
            return ApiErrorConstants.somethingWentWrong
        }
    }
}
