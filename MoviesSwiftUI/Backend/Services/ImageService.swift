//
//  ImageService.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 22/06/23.
//

import Foundation

class URLImageService:ObservableObject{
    @Published var urlImageData:Data?
    func getUrlImageData(url:String){
        let urlSessionClient =  UrlSessionClient()
        let url = URL(string: url)
        guard let url = url else{
            return
        }
        guard let urlSession = urlSessionClient.urlSession else{
            return
        }
        urlSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.urlImageData = data
            }
        }.resume()
    }
}
