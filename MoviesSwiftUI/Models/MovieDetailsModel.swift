//
//  MovieDetailsModel.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 24/06/23.
//

import Foundation

struct MovieDetailsModel:Codable{
    var adult:Bool
    var backdropPath:String
    var belongsToCollection:BelongsToCollectionModel
    var budget:Int64
    var genres:[GenreModel]
    var homePageUrl:String
    var id:Int
    var imdbId:String
    var originalLanguage:String
    var originalTitle:String
    var overView:String
    var popularity:Double
    var posterPath:String
    var productionCompanies:[ProductionCompaniesModel]
    var productionCountries:[ProductionCountriesModel]
    var releaseDate: String
    var revenue: Int64
    var runTime:Int
    var spokenLanguages:[SpokenLanguagesModel]
    var status:String
    var tagLine:String
    var title:String
    var video: Bool
    var voteAverage:Double
    var voteCount:Int
    private enum CodingKeys:String,CodingKey{
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homePageUrl = "homepage"
        case id = "id"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overView = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runTime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagLine = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}



struct BelongsToCollectionModel:Codable{
    var collectionId:Int
    var collectionName:String
    var posterPath:String
    var backdropPath:String
    
    private enum CodingKeys:String,CodingKey{
        case collectionId = "id"
        case collectionName = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}


struct GenreModel:Codable{
    var genreId:Int
    var genreName:String
    
    private enum CodingKeys:String,CodingKey{
        case genreId = "id"
        case genreName = "name"
    }
}

struct ProductionCompaniesModel:Codable{
    var productionCompanyId:Int
    var productionCompanyLogoPath:String?
    var productionCompanyName:String
    var productionCompanyOriginCountry:String
    
    private enum CodingKeys:String,CodingKey{
        case productionCompanyId = "id"
        case productionCompanyLogoPath = "logo_path"
        case productionCompanyName = "name"
        case productionCompanyOriginCountry = "origin_country"
    }
}

struct ProductionCountriesModel:Codable{
    var productionCountryCode:String
    var productionCountryName:String
    
    private enum CodingKeys:String,CodingKey{
        case productionCountryCode = "iso_3166_1"
        case productionCountryName = "name"
    }
}

struct SpokenLanguagesModel:Codable{
    var spokenLanguagesEnglishName:String
    var spokenLanguagesCode:String
    var spokenLanguagesOriginName:String
    
    private enum CodingKeys:String,CodingKey{
        case spokenLanguagesEnglishName = "english_name"
        case spokenLanguagesCode = "iso_639_1"
        case spokenLanguagesOriginName = "name"
    }
    
}
