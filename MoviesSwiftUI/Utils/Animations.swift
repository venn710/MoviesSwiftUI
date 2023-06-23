//
//  Animations.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation
import SwiftUI

struct DotLoaderAnimation:View{
    @State var scaledSizeOfCircleOne = 1.0
    @State var scaledSizeOfCircleTwo = 1.0
    @State var scaledSizeOfCircleThree = 1.0
    var timer = Timer.publish(every: 0.2, on: .current, in: .common).autoconnect()
    var body: some View{
        HStack(spacing: 20) {
            CircleItem(scaledSize: scaledSizeOfCircleOne)
            CircleItem(scaledSize: scaledSizeOfCircleTwo)
            CircleItem(scaledSize: scaledSizeOfCircleThree)
        }
        .onAppear(){
            scaledSizeOfCircleOne = 1.5
            scaledSizeOfCircleTwo = 1
            scaledSizeOfCircleThree = 1
        }
        .onReceive(timer){ _ in
            modifyCircleScale()
        }
        .animation(.spring(dampingFraction: 0.3), value: scaledSizeOfCircleOne)
        .animation(.spring(dampingFraction: 0.3), value: scaledSizeOfCircleTwo)
        .animation(.spring(dampingFraction: 0.3), value: scaledSizeOfCircleThree)
    }
    func modifyCircleScale()
    {
        if (scaledSizeOfCircleOne == 1.5)
        {
            scaledSizeOfCircleOne = 1
            scaledSizeOfCircleTwo = 1.5
            scaledSizeOfCircleThree = 1
        }
        else if (scaledSizeOfCircleTwo == 1.5)
        {
            scaledSizeOfCircleOne = 1
            scaledSizeOfCircleTwo = 1
            scaledSizeOfCircleThree = 1.5
        }
        else if (scaledSizeOfCircleThree == 1.5)
        {
            scaledSizeOfCircleOne = 1.5
            scaledSizeOfCircleTwo = 1
            scaledSizeOfCircleThree = 1
        }
    }
}

struct CircleItem:View{
    var scaledSize:Double
    var body: some View{
        Circle()
            .fill(.loaderColor)
            .scaleEffect(scaledSize)
            .frame(width: 15,height: 15)
    }
}
