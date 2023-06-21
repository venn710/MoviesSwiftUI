//
//  WebService.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import Foundation
import Combine

class WebService{
    static func headersConfigurator()->[String:String]?{
        let bearerToken = Bundle.main.infoDictionary?["BEARER_TOKEN"] as? String
        guard let bearerToken = bearerToken else{
            return ["Accept": "application/json"]
        }
        return [
            "Authorization" : "Bearer \(bearerToken)",
            "Accept": "application/json"
        ]
    }
    static func urlRequstConfigurator(endPoint:ApiEndPoint,method:String,requestBody:Data?) throws ->URLRequest{
        let url = URL(string: ApiConstants.baseUrl+endPoint.apiEndPoint())
        guard let url = url else{
            throw ApiError.invalidUrl
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = requestBody
        urlRequest.allHTTPHeaderFields = headersConfigurator()
        return urlRequest
    }
    static func apiCall<T:Codable>(endPoint:ApiEndPoint,method:String,requestBody:Data?,completion:@escaping (Result<T,ApiError>)->()){
        let urlRequest = try? urlRequstConfigurator(endPoint: endPoint, method: method, requestBody: requestBody)
        guard let urlRequest = urlRequest else{
            return completion(.failure(.invalidUrl))
        }
        URLSession
            .shared
            .dataTask(with: urlRequest) { data, response, error in
                guard let data = data,error == nil else{
                    completion(.failure(.invalidData))
                    return
                }
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                guard let decodedData = decodedData else{
                    completion(.failure(.invalidData))
                    return
                }
                completion(.success(decodedData))
            }.resume()
    }
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

public enum ApiError:Error{
    case invalidUrl
    case invalidData
    case somethingWentWrong
}

public enum ApiEndPoint{
    case popular
    func apiEndPoint()->String{
        switch (self) {
        case .popular:
            return "/movie/popular"
        }
    }
}
