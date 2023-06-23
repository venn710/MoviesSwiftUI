//
//  UrlSessionClient.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation

class UrlSessionClient{
    var urlSession:URLSession?
    init() {
        initialiseClient()
    }
    func initialiseClient(){
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.urlCache = .shared
        urlSessionConfiguration.httpAdditionalHeaders = headersConfigurator()
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
    func headersConfigurator()->[String:String]?{
        let bearerToken = Bundle.main.infoDictionary?["BEARER_TOKEN"] as? String
        guard let bearerToken = bearerToken else{
            return ["Accept": "application/json"]
        }
        return [
            "Authorization" : "Bearer \(bearerToken)",
            "Accept": "application/json"
        ]
    }
}

