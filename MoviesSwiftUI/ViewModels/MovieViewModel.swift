//
//  MovieViewModel.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

import Foundation

class MovieViewModel:ObservableObject{
    @Published var moviesList:[MovieModel]=[]
    @Published var popularMovies:[MovieDetailsModel] = []
    @Published var isLoading = false
//
//    init(){
//        getPopularMovies()
//    }
//
    @Published var popularMoviesErrorMessage = ""
    
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
    
    func getPopularMovies() {
        self.isLoading = true
        WebService.apiCall(endPoint: .popular, method: "GET", requestBody: nil) { (result: Result<PopularMoviesModel,ApiError>)  in
            switch result {
            case .success(let popularMoviesModel):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                    self.popularMovies = popularMoviesModel.results
                    print(self.popularMovies.count)
                    self.popularMoviesErrorMessage = ""
                    self.isLoading = false
                }
                case .failure(let error):
                DispatchQueue.main.async{
                    self.popularMovies = []
                    self.popularMoviesErrorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
            
        }
    }
}
