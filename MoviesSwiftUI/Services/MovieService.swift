//
//  MovieService.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

import Foundation



class MovieService{
    static func getAllMovies(searchTerm:String,completion:@escaping (MovieSearch?)->()){
        let url=URL(string: "https://www.omdbapi.com/?s=\(searchTerm)&page=1&apiKey=4ab13aa8")
        guard let url = url else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data=data,error==nil else{
                completion(nil)
                return
            }
            let decodedData = try? JSONDecoder().decode(MovieSearch.self, from: data)
            guard let decodedData = decodedData else{
                completion(nil)
                return
            }
            completion(decodedData)
        }.resume()
    }
}
class URLImageService:ObservableObject{
    @Published var urlImageData:Data?
    func getUrlImageData(url:String){
        let url = URL(string: url)
        guard let url = url else{
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error==nil else{
                return
            }
            DispatchQueue.main.async {
                self.urlImageData = data
            }
        }.resume()
    }
}

