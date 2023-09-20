//
//  MovieViewModel.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 22/05/23.
//

import Foundation
import Combine

class MovieViewModel:ObservableObject{
    
    @Published var popularMoviesLoadingState:Loader<MoviesModel> = .idle
    @Published var nowPlayingMoviesLoadingState:Loader<MoviesModel> = .idle
    @Published var topRatedMoviesLoadingState:Loader<MoviesModel> = .idle
    @Published var upcomingMoviesLoadingState:Loader<MoviesModel> = .idle
    @Published var movieDetailsLoadingState:Loader<MovieDetailsModel> = .idle
     
    init(){
//        getPopularMovies()
//        getUpcomingMovies()
//        getTopRatedMovies()
//        getNowPlayingMovies()
    }
    
    
    func getPopularMovies() {
        getMoviesData(stateKeyPath: \.popularMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .popular)
    }
    func getUpcomingMovies() {
        getMoviesData(stateKeyPath: \.upcomingMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .upcoming)
    }
    func getTopRatedMovies() {
        getMoviesData(stateKeyPath: \.topRatedMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .topRated)
    }
    func getNowPlayingMovies() {
        getMoviesData(stateKeyPath: \.nowPlayingMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .nowPlaying)
    }
    func getMovieDetails(movieId:Int){
        getMoviesData(stateKeyPath: \.movieDetailsLoadingState, method: "GET", requestBody: nil, endPoint: .movieDetails(movieId: movieId))
    }
    func getMoviesData<T:Codable>(stateKeyPath:ReferenceWritableKeyPath<MovieViewModel,Loader<T>>,method:String,requestBody:Data?,endPoint:ApiEndPoint){
        print("calling from VM")
        self[keyPath: stateKeyPath] = .loading
        let webService = WebService()
        webService.apiCall(endPoint: endPoint, method: method, requestBody: requestBody) { (result: Result<T,ApiError>)  in
            switch result {
            case .success(let moviesModel):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self[keyPath: stateKeyPath] = .success(moviesModel)
                }
            case .failure(let error):
                DispatchQueue.main.async{
                    self[keyPath: stateKeyPath] = .Error(error)
                }
            }
            
        }
    }
}
