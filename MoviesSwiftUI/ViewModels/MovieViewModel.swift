//
//  MovieViewModel.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

import Foundation

class MovieViewModel:ObservableObject{
    @Published var moviesList:[MovieModel]=[]
    
    func getMoview(searchText:String)
    {
        MovieService.getAllMovies(searchTerm: searchText) { movieSearch in
            guard let movieSearch = movieSearch else{
                DispatchQueue.main.async{
                    self.moviesList = []
                }
                return
            }
            DispatchQueue.main.async{
                self.moviesList = movieSearch.search
                print("length is \(self.moviesList.count)")
            }
        }
    }
}
