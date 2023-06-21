//
//  ApiConstants.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import Foundation

struct ApiConstants{
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/original"
}

struct ApiErrorConstants{
    static let urlValidationError = "Given URL is invalid please pass a valid URL"
    static let dataParsingError = "Unable to Parse the data"
    static let requestError = "Unable to initialise a URL request"
    static let somethingWentWrong = "Something Went wrong please try again"
}
