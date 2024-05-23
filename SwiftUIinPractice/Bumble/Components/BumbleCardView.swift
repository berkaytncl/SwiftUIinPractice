//
//  BumbleCardView.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 20.05.2024.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mock
    var onSendAComplimentPressed: VoidAction = nil
    var onSuperLikePressed: VoidAction = nil
    var onXmarkPressed: VoidAction = nil
    var onCheckmarkPressed: VoidAction = nil
    var onHideAndReportPressed: VoidAction = nil
    
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
                
                Group {
                    aboutMeSection
                    myInterestsSection
                }
                .padding(24)
                
                ForEach(user.images, id: \.self) { image in
                    ImageLoaderView(urlString: image)
                        .frame(height: cardFrame.height)
                }
                
                Group {
                    locationSection
                    footerSection
                        .padding(.vertical, 32)
                }
                .padding(24)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .overlay(
            superlikeButton
                .padding(24)
            
            , alignment: .bottomTrailing
        )
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private var superlikeButton: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            )
            .onTapGesture {
                onSuperLikePressed?()
            }
    }
    
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        
                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .spotifyBlack.opacity(0),
                        .spotifyBlack.opacity(0.6),
                        .spotifyBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle(title: "About Me")
            
            Text(user.aboutMe)
                .font(.body)
            
            HStack(spacing: 0) {
                BumbleHeartView()
                
                Text("Send a Compliment")
                    .font(.caption)
            }
            .padding(.horizontal, 8)
            .background(.bumbleYellow)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .onTapGesture {
                onSendAComplimentPressed?()
            }
        }
        .fontWeight(.semibold)
        .foregroundStyle(.bumbleBlack)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterestsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My basics")
                InterestPillGridView(interests: user.basics)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My interests")
                InterestPillGridView(interests: user.interests)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
            
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            InterestPillView(iconName: nil, emoji: "🇹🇷", text: "Lives in Istanbul")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var footerSection: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay (
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay (
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckmarkPressed?()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(.bumbleBackgroundYellow.opacity(0.001))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
