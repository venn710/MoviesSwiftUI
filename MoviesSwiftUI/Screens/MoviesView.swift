//
//  MoviesView.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 15/06/23.
//

import SwiftUI

struct MoviesView: View {
    private var gridColumns = [GridItem(.flexible()),GridItem(.flexible())]
    @State var searchText:String = ""
    @State var offsetY = UIScreen.main.bounds.size.height
    @State var showingSnackBar = false
    var screenSize = UIScreen.main.bounds.size
    @StateObject var movieViewModel = MovieViewModel()
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                VStack{
                    CustomtextField(searchText: $searchText, movieViewModel: movieViewModel)
                    Spacer()
                    ScrollView(showsIndicators:false){
                        LazyVGrid(columns:gridColumns,alignment: .leading){
                            ForEach(movieViewModel.moviesList) { movie in
                                VStack(alignment:.center){
                                    
                                    AsyncImage(url: URL(string: movie.poster)) { Image in
                                        Image
                                            .resizable()
                                    } placeholder: {
                                        Image("MovieModel")
                                            .resizable()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)

    //                                CustomImageView(imageUrl: movie.poster)
    //                                    .frame(maxWidth: .infinity)
    //                                    .frame(height: 280)

                                    
                                    VStack(alignment: .center){
                                        Text(movie.title)
                                        Text(movie.type.uppercased())
                                        Text(movie.year)
                                            .fontWeight(.heavy)
                                    }
                                    .frame(height:100,alignment:.top)
                                    
                                }
                            }
                        }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,16)
                }
                SnackBar(snackBarConfiguraionObject: SnackBarConfiguration(imageName: "xmark.circle.fill", title: "Error", description: "This is one of the Error", backgroundColor: .red),showingSnackBar: $showingSnackBar)
                    .offset(y:offsetY)
            }
            .animation(.spring(dampingFraction: 0.7), value: offsetY)
            .onChange(of: showingSnackBar, perform: { newValue in
                    if newValue {
                        offsetY = 0
                    }
                    else{
                        offsetY = screenSize.height
                    }
            })
            .navigationTitle("MOVIES")
        }
    }
}

