//
//  BumbleFilterView.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 19.05.2024.
//

import SwiftUI

struct BumbleFilterView: View {
    
    @Binding var selection: Filter
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(Filter.allCases, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option.rawValue.capitalized)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .background(.bumbleWhite.opacity(0.001))
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    @State var selection: Filter = .everyone
    
    var body: some View {
        BumbleFilterView(selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
