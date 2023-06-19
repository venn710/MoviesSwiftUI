//
//  MovieModel.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

import Foundation

struct MovieSearch:Decodable{
    
    var search:[MovieModel]
    
    private enum CodingKeys:String,CodingKey{
        case search="Search"
    }
    
}

struct MovieModel:Identifiable,Decodable{
    var id:String
    var title:String
    var year:String
    var type:String
    var poster:String
    
    private enum CodingKeys:String,CodingKey{
        case id="imdbID"
        case title="Title"
        case type="Type"
        case poster="Poster"
        case year="Year"
    }
}

