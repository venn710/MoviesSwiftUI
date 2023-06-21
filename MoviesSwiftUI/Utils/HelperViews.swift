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
struct DotLoader:View{
    @State var sizeOfDotOne = 1.0
    @State var sizeOfDotTwo = 1.0
    @State var sizeOfDotThree = 1.0
    var timer = Timer.publish(every: 0.2, on: .current, in: .common).autoconnect()
    var body: some View{
        HStack(spacing: 20) {
            Circle()
                .fill(.red)
                .scaleEffect(sizeOfDotOne)
            Circle()
                .fill(.red)
                .scaleEffect(sizeOfDotTwo)
            Circle()
                .fill(.red)
                .scaleEffect(sizeOfDotThree)
        }
        .onAppear(){
            sizeOfDotOne = 1.5
            sizeOfDotTwo = 1
            sizeOfDotThree = 1
        }
        .onReceive(timer){ _ in
            print(sizeOfDotOne,sizeOfDotTwo,sizeOfDotThree)
            if (sizeOfDotOne == 1.5)
            {
                sizeOfDotOne = 1
                sizeOfDotTwo = 1.5
                sizeOfDotThree = 1
            }
            else if (sizeOfDotTwo == 1.5)
            {
                sizeOfDotOne = 1
                sizeOfDotTwo = 1
                sizeOfDotThree = 1.5
            }
            else if (sizeOfDotThree == 1.5)
            {
                sizeOfDotOne = 1.5
                sizeOfDotTwo = 1
                sizeOfDotThree = 1
            }
        }
        .animation(.spring(dampingFraction: 0.3), value: sizeOfDotOne)
        .animation(.spring(dampingFraction: 0.3), value: sizeOfDotTwo)
        .animation(.spring(dampingFraction: 0.3), value: sizeOfDotThree)
    }
}
