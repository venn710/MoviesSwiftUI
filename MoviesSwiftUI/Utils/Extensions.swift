//
//  Extensions.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 24/06/23.
//

import Foundation
import SwiftUI

extension View{
    func toolBarModifier(navigationTitle:String = "")->some View{
        return modifier(ToolBarModifier(navigationTitle:navigationTitle))
    }
}

struct ToolBarModifier:ViewModifier{
    
    @Environment(\.presentationMode) var presentationMode
    var navigationTitle:String
    func body(content: Content) -> some View {
     content
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    if presentationMode.wrappedValue.isPresented {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "arrow.backward")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension Color{
    static func getColorFromHexCode(hexCode:String) -> Color{
        var hexSanitized = hexCode.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return .white }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return .white
        }

        return self.init(red: r, green: g, blue: b, opacity: a)
    }
}

