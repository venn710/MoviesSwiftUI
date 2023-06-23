//
//  WebService.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import Foundation
import Combine

class WebService{
    
    var urlSessionClient = UrlSessionClient()
    
    func apiCall<T:Codable>(endPoint:ApiEndPoint,method:String,requestBody:Data?,completion:@escaping (Result<T,ApiError>)->()){
        let httpRequest = HTTPRequest(endPoint: endPoint, method: method,requestBody: requestBody)
        let urlRequest = httpRequest.finalUrlRequest
        guard let urlRequest = urlRequest else{
            return completion(.failure(.invalidUrl))
        }
        urlSessionClient.urlSession?.dataTask(with: urlRequest) { data, response, error in
                guard let data = data,error == nil else{
                    completion(.failure(.somethingWentWrong))
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
