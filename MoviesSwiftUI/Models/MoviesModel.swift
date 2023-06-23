//
//  MovieModel.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

struct MoviesModel:Codable{
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
