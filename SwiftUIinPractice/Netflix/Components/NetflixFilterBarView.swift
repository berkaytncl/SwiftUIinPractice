//
//  NetflixFilterBarView.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 22.05.2024.
//

import SwiftUI

struct NetflixFilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: Action<FilterModel> = nil
    var onXMarkPressed: VoidAction = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(.netflixBlack.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(.netflixBlack.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && (filter == filters.first)) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct NetflixFilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        NetflixFilterBarView(
            filters: filters,
            selectedFilter: selectedFilter) { newFilter in
                selectedFilter = newFilter
            } onXMarkPressed: {
                selectedFilter = nil
            }

    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        NetflixFilterBarViewPreview()
    }
}
