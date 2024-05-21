//
//  BumbleProfileImageCell.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 21.05.2024.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = .random(in: 0...1)
    var hasNewMassage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray.opacity(0.8), lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(.degrees(270))
                .scaleEffect(x: -1)
            
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(6)
        }
        .frame(width: 75, height: 75)
        .overlay(
            ZStack {
                if hasNewMassage {
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    VStack {
        BumbleProfileImageCell()
        BumbleProfileImageCell(percentageRemaining: 1)
        BumbleProfileImageCell(percentageRemaining: 0)
        BumbleProfileImageCell(hasNewMassage: false)
    }
}
