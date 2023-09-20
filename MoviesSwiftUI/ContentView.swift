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
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.primaryColor)
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View{
        NavigationView{
            HomeScreen()
                .preferredColorScheme(.light)
        }
    }
}
