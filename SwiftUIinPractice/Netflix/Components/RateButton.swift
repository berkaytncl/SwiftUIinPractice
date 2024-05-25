//
//  RateButton.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 26.05.2024.
//

import SwiftUI

enum RateOption: CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike: 
            "Not for me"
        case .like:
            "I like this"
        case .love:
            "Love this!"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            "hand.thumbsdown"
        case .like:
            "hand.thumbsup"
        case .love:
            "bolt.heart"
        }
    }
}

struct RateButton: View {
    
    @State private var showPopover: Bool = false
    var onRatingSelected: Action<RateOption> = nil
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.thumbsup")
                .font(.title)
            
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(.netflixBlack.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover, content: {
            ZStack {
                Color.netflixDarkGray.ignoresSafeArea()
                
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        })
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.iconName)
                .font(.title2)
            
            Text(option.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(.netflixBlack.opacity(0.001))
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option)
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        RateButton()
    }
}
