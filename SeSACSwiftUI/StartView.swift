//
//  StartView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("홈")
                    Image(systemName: "star")
                }
            CategoryView()
                .tabItem {
                    Text("검색")
                    Image(systemName: "pencil")
                }
            RenderView()
                .tabItem {
                    Text("설정")
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    StartView()
}
