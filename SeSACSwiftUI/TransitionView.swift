//
//  TransitionView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button(action: {
                    isFull.toggle()
                }, label: {
                    Text("Full")
                })
                
                Button(action: {
                    isSheet.toggle()
                }, label: {
                    Text("Sheet")
                })
                
                NavigationLink("Push") {
                    MovieView()
                }
            }
            .sheet(isPresented: $isSheet, content: {
                RenderView()
            })
            .fullScreenCover(isPresented: $isFull, content: {
                ContentView()
        })
        }
    }
}

#Preview {
    TransitionView()
}
