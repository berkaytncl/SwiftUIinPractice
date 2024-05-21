//
//  BumbleChatPreviewCell.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 21.05.2024.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = .random(in: 0...1)
    var hasNewMassage: Bool = true
    var userName: String = "Terry"
    var lastChatMassage: String? = "This is the last message"
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMassage: hasNewMassage
            )
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .foregroundStyle(.bumbleBlack)
                            .background(.bumbleYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                }
                
                if let lastChatMassage {
                    Text(lastChatMassage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
        }
        .lineLimit(1)
    }
}

#Preview {
    BumbleChatPreviewCell()
        .padding()
}
