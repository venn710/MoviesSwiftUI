//
//  HttpRequest.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation

class HTTPRequest{
    var endPoint:ApiEndPoint
    var method:String
    var requestBody:Data?
    var finalUrlRequest:URLRequest?
    init(endPoint: ApiEndPoint, method: String, requestBody: Data?) {
        self.endPoint = endPoint
        self.method = method
        self.requestBody = requestBody
        initialiseUrlRequest()
    }
    func initialiseUrlRequest(){
        let url = URL(string: ApiConstants.baseUrl+endPoint.apiEndPoint())
        guard let url = url else{
            finalUrlRequest = nil
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = requestBody
        finalUrlRequest = urlRequest
    }
}
