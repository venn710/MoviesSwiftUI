//
//  HomeScreen.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 21/06/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var movieViewModel = MovieViewModel()
    var body: some View {
        let _ = Self._printChanges()
        VStack(alignment: .leading){
            Text("POPULAR")
            if movieViewModel.isLoading
            {
                DotLoader()
                .frame(maxWidth: 80,maxHeight: 300)
                .frame(maxWidth: .infinity,alignment: .center)
            }
            else
            {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(movieViewModel.popularMovies,id: \.id){movie in
                            MovieCardView(movieDetails: movie)
                        }
                    }
                }
            }
            Text("Popular")
            if movieViewModel.isLoading
            {
                DotLoader()
                .frame(maxWidth: 80,maxHeight: 300)
                .frame(maxWidth: .infinity,alignment: .center)
            }
            else{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(movieViewModel.popularMovies,id: \.id){movie in
                            MovieCardView(movieDetails: movie)
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .padding(16)
        .onAppear{
            movieViewModel.getPopularMovies()
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
            AsyncImage(url: URL(string: ApiConstants.imageBaseUrl+movieDetails.backDropPath)) { image in
                image
                    .resizable()
            } placeholder: {
                Image("Image_placeholder")
                    .resizable()
            }
            .frame(width: 200,height: 250)
            .cornerRadius(12)
            Text(movieDetails.title)
            Spacer()
        }
        .frame(maxWidth: 200,maxHeight: .infinity)
    }
}
