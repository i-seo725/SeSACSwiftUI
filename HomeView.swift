//
//  HomeView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                        AsyncImageView()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
