//
//  ShareButton.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 26.05.2024.
//

import SwiftUI

struct ShareButton: View {
    
    var url: String = "https://www.swiftful-thinking.com"
    
    @ViewBuilder
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(.netflixBlack.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        ShareButton()
    }
}
