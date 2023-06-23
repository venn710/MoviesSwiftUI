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
    
    
    func getPopularMovies() {
        getMovies(stateKeyPath: \.popularMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .popular)
    }
    func getUpcomingMovies() {
        getMovies(stateKeyPath: \.upcomingMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .upcoming)
    }
    func getTopRatedMovies() {
        getMovies(stateKeyPath: \.topRatedMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .topRated)
    }
    func getNowPlayingMovies() {
        getMovies(stateKeyPath: \.nowPlayingMoviesLoadingState,method: "GET",requestBody: nil,endPoint: .nowPlaying)
    }
    func getMovies(stateKeyPath:ReferenceWritableKeyPath<MovieViewModel,Loader<MoviesModel>>,method:String,requestBody:Data?,endPoint:ApiEndPoint){
        self[keyPath: stateKeyPath] = .loading
        let webService = WebService()
        webService.apiCall(endPoint: endPoint, method: method, requestBody: requestBody) { (result: Result<MoviesModel,ApiError>)  in
            switch result {
            case .success(let moviesModel):
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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
