//
//  FilterModel.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 22.05.2024.
//

import Foundation

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}
