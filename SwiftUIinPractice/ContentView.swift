//
//  ContentView.swift
//  SwiftUIinPractice
//
//  Created by Berkay Tuncel on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    private let database = DatabaseHelper()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(users) { user in
                    Text(user.firstName)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await database.getUsers()
            products = try await database.getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
