//
//  LoaderStates.swift
//  MoviesSwiftUI
//
//  Created by Venkatesham Boddula on 23/06/23.
//

import Foundation

enum Loader<T>{
    case idle
    case loading
    case success(T)
    case Error(Error)
}
