//
//  HomeScreen.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var movieViewModel = MovieViewModel()
    @State var shouldFetchMoviesData = true
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HomeScreenScrollableView(movieViewModel: movieViewModel, title:"POPULAR",loaderState: movieViewModel.popularMoviesLoadingState)
            HomeScreenScrollableView(movieViewModel: movieViewModel,title:"NOW PLAYING",loaderState: movieViewModel.nowPlayingMoviesLoadingState)
            HomeScreenScrollableView(movieViewModel: movieViewModel,title:"UPCOMING",loaderState: movieViewModel.upcomingMoviesLoadingState)
            HomeScreenScrollableView(movieViewModel: movieViewModel,title:"TOP RATED",loaderState: movieViewModel.topRatedMoviesLoadingState)
        }
        .frame(maxWidth: .infinity,alignment: .top)
        .padding(.vertical,16)
        .background(.primaryColor)
        .onAppear {
            if shouldFetchMoviesData
            {
                movieViewModel.getPopularMovies()
                movieViewModel.getNowPlayingMovies()
                movieViewModel.getUpcomingMovies()
                movieViewModel.getTopRatedMovies()
                shouldFetchMoviesData = false
            }
        }
        .refreshable {
            movieViewModel.getPopularMovies()
            movieViewModel.getNowPlayingMovies()
            movieViewModel.getUpcomingMovies()
            movieViewModel.getTopRatedMovies()
        }
    }
}

struct MovieCardView:View{
    var movieResultsModel:MovieResultsModel
    var body: some View{
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: ApiConstants.imageBaseUrl+movieResultsModel.posterPath),transaction:.init(animation: .easeIn), content: { imagePhase in
                switch imagePhase{
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                default:
                    ZStack(alignment: .top){
                        Color.teal
                        Image("Image_placeholder")
                            .resizable()
                            .opacity(0.5)
                            .aspectRatio(contentMode: .fit)
                            .overlay(alignment:.bottom) {
                                Text(movieResultsModel.title)
                                    .foregroundColor(.white.opacity(0.5))
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                    .padding(4)
                            }
                    }
                }}
            )
            .cornerRadius(12)
        }
    }
    }



struct HomeScreenScrollableView:View{
    var movieViewModel:MovieViewModel
    var title:String
    var loaderState:Loader<MoviesModel>
    var body: some View{
        VStack(alignment: .center){
            Text(title)
                .foregroundColor(.titleColor)
                .fontWeight(.bold)
            switch loaderState{
            case .loading,.idle:
                DotLoaderAnimation()
                    .frame(maxHeight:.infinity,alignment: .center)
            case .success(let moviesModel):
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing: 0){
                        ForEach(moviesModel.results,id: \.id){movieResultsModel in
                            NavigationLink(destination: {
                                MovieDetailsView(movieResultsModel:movieResultsModel)
                            }, label: {
                                MovieCardView(movieResultsModel: movieResultsModel)
                                    .padding(.horizontal,5)
                            })
                            .buttonStyle(.plain)
                        }
                    }
                }
            case .Error(let error):
                ErrorView(error: error)
                    .frame(maxHeight: .infinity,alignment:.center)
                
            }
        }
        .frame(height: 250)
    }
    
}
