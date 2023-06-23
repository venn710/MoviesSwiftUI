//
//  HomeScreen.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var movieViewModel = MovieViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollView(showsIndicators: false){
            HomeScreenScrollableView(title:"POPULAR",loaderState: movieViewModel.popularMoviesLoadingState)
            HomeScreenScrollableView(title:"NOW PLAYING",loaderState: movieViewModel.nowPlayingMoviesLoadingState)
            HomeScreenScrollableView(title:"UPCOMING",loaderState: movieViewModel.upcomingMoviesLoadingState)
            HomeScreenScrollableView(title:"TOP RATED",loaderState: movieViewModel.topRatedMoviesLoadingState)
        }
        .frame(maxWidth: .infinity,alignment: .top)
        .padding(.vertical,16)
        .background(.primaryColor)
        .onAppear{
            movieViewModel.getPopularMovies()
            movieViewModel.getNowPlayingMovies()
            movieViewModel.getUpcomingMovies()
            movieViewModel.getTopRatedMovies()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct MovieCardView:View{
    var movieDetails:MovieDetailsModel
    var body: some View{
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: ApiConstants.imageBaseUrl+movieDetails.posterPath),transaction:.init(animation: .easeIn), content: { imagePhase in
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
                                Text(movieDetails.title)
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
                        ForEach(moviesModel.results,id: \.id){movie in
                            MovieCardView(movieDetails: movie)
                                .padding(.horizontal,5)
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
