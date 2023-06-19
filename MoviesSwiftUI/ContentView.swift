//
//  ContentView.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 13/05/23.
//

import SwiftUI


struct User:Codable{
    var firstName:String
    var lastName:String
}

struct ContentView: View {
    var body: some View{
        MoviesView()
            .preferredColorScheme(.light)
    }
}
