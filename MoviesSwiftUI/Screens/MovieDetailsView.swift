//
//  MovieDetailsView.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 24/06/23.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var moviesViewModel1 = MovieViewModel()
    var movieResultsModel:MovieResultsModel
    var body: some View {
        VStack(alignment: .leading){
            switch moviesViewModel1.movieDetailsLoadingState {
            case .loading,.idle:
                DotLoaderAnimation()
                    .frame(maxHeight:.infinity,alignment: .center)
            case .success(let movieDetailsModel):
                VStack{
                    MovieDetailsImageView(movieDetailsModel: movieDetailsModel)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                }
            case .Error(let error):
                ErrorView(error: error)
                    .frame(maxHeight: .infinity,alignment:.center)
            }
        }
        .onAppear(){
            moviesViewModel1.getMovieDetails(movieId: movieResultsModel.id)
        }
        .frame(alignment: .top)
        .toolBarModifier(navigationTitle: movieResultsModel.title)
    }
}

struct MovieDetailsImageView:View{
    var movieDetailsModel:MovieDetailsModel
    var body: some View{
        ZStack{
            Color.imagePlaceHolderColor
            AsyncImage(url: URL(string: ApiConstants.imageBaseUrl + movieDetailsModel.backdropPath),transaction: .init(animation: .linear)){ imagePhase in
                switch imagePhase {
                case .success(let image):
                    image
                        .resizable()
                default:
                    Image("Image_placeholder")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
