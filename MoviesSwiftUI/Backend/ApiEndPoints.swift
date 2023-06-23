//
//  ApiEndPoints.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation

public enum ApiEndPoint{
    case popular
    case nowPlaying
    case topRated
    case upcoming
    
    func apiEndPoint()->String{
        switch (self) {
        case .popular:
            return "/movie/popular"
        case .nowPlaying:
            return "/movie/now_playing"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        }
    }
}
