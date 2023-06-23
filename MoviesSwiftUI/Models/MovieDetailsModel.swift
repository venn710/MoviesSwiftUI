//
//  MovieDetailsModel.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 22/06/23.
//

import Foundation

struct MovieDetailsModel:Codable{
    var adult:Bool
    var backDropPath:String
    var genreIds:[Int]
    var id:Int
    var originalLanguage:String
    var originalTitle:String
    var overview:String
    var popularity:Double
    var posterPath:String
    var releaseDate:String
    var title:String
    var video: Bool
    var voteAverage: Double
    var voteCount:Int
    private enum CodingKeys:String,CodingKey{
        case adult = "adult"
        case backDropPath="backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}
