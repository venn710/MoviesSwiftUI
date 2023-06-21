//
//  NowPlayingModel.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 19/06/23.
//

import Foundation
struct PopularMoviesModel:Codable{
    var page:Int
    var results:[MovieDetailsModel]
    var totalPages:Int
    var totalResults:Int
    private enum CodingKeys:String,CodingKey{
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
