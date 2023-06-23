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
    @State var image:Image = Image("Image_placeholder")
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        imageService.getUrlImageData(url: imageUrl)
    }
    
    var body: some View {
        VStack{
            image
                .resizable()
                .scaledToFit()
        }
        .onChange(of: imageService.urlImageData, perform:loadImage)
    }
    func loadImage(imageData:Data?){
        guard let imageData = imageData, let uiImage = UIImage(data: imageData) else{
            image = Image("Image_placeholder")
            return
        }
        withAnimation{
            image = Image(uiImage: uiImage)
        }
    }
}


struct ErrorView:View{
    var error:Error
    var body: some View{
        Text(error.localizedDescription)
            .foregroundColor(.red)
    }
}
