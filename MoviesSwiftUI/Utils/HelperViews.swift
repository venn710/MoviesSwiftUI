//
//  HelperViews.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 15/06/23.
//

import Foundation
import SwiftUI

struct CustomImageView:View{
    
    var imageUrl:String
    @ObservedObject var imageService = URLImageService()
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        imageService.getUrlImageData(url: imageUrl)
    }
    
    var body: some View {
        guard let urlImageData = imageService.urlImageData else{
            return Image("MovieModel")
                .resizable()
                .scaledToFit()
        }
        return Image(uiImage: UIImage(data: urlImageData)!)
            .resizable()
            .scaledToFit()
    }
}




struct CustomtextField:View{
    @Binding var searchText:String
    @ObservedObject var movieViewModel:MovieViewModel // Passing the reference of stateObject here it is not creating new object of MovieViewModel.
    var body: some View{
        HStack{
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Enter Movie Name", text: $searchText)
                .background(Color(.secondarySystemBackground))
                .textFieldStyle(.roundedBorder)
                .cornerRadius(4)
                .padding(10)
                .onSubmit {
                    print("searchtext is \(searchText)")
                    movieViewModel.getMoview(searchText: searchText)
                }
            Spacer()
        }
            
    }
}
