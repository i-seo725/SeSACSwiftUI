//
//  SearchView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/16/23.
//

import SwiftUI

//struct SearchView: View {
//    //버튼을 누를 때 SearchView에 있는 메서드와 프로퍼티 모두 다시 렌더링 됨
//    @State var randomNumber = 0
//    
//    init(randomNumber: Int = 0) {
//        self.randomNumber = randomNumber
//        print("SearchView Init")
//    }
//    
//    var body: some View {
//        VStack {
//            HueView()
//            jackView
//            kokoView()
//            Text("Bran \(randomNumber)")
//                .background(Color.random())
//            Button("클릭") {
//                randomNumber = Int.random(in: 1...100)
//            }
//        }
//    }
//    
//    var jackView: some View {
//        Text("Jack")
//            .background(Color.random())
//    }
//    
//    func kokoView() -> some View {
//        Text("Koko")
//            .background(Color.random())
//    }
//}

struct Movie: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let color = Color.random()
}


struct SearchView: View {
    
    @State private var searchQuery = ""
    @State private var text = ""
    
    let movie = [
        Movie(name: "아이언맨"),
        Movie(name: "인터스텔라"),
        Movie(name: "킨더조이"),
        Movie(name: "치킨"),
        Movie(name: "인터넷"),
        Movie(name: "ABC"),
        Movie(name: "AABB")
    ]
    
    var filterMovie: [Movie] {
        return searchQuery.isEmpty ? movie : movie.filter { $0.name.contains(searchQuery) }
    }
    
    //navigationStack: value
    //navigationView: Destination
    var body: some View {
        NavigationStack {
            List {
                ForEach(filterMovie, id: \.id) { item in
                    //                    NavigationLink {
                    //                        SearchDetailView(movie: item)
                    //                    } label: {
                    //                        HStack {
                    //                            Circle().foregroundColor(item.color)
                    //                            Text(item.name)
                    //                        }
                    //                        .frame(height: 60)
                    //                    }
                    NavigationLink(value: item) {
                        HStack {
                            Circle().foregroundColor(item.color)
                            Text(item.name)
                        }
                        .frame(height: 60)
                    }
                }
            }
            .navigationTitle("검색")
            .navigationDestination(for: Movie.self) { item in
                SearchDetailView(movie: item)
            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색해보세요")
        .onSubmit(of: .search) {
            print(searchQuery)
        }
    }
    
}


struct SearchDetailView: View {

    let movie: Movie

    var body: some View {
        VStack {
            Text(movie.name)
            Button("Default Button") {
                print("test")
            }
            Button(action: {
                print("test2")
            }, label: {
                HStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(movie.color)
                    Text("Button")
                }
                .frame(width: 130, height: 40)
            })
        }
    }
}

#Preview {
    SearchView()
}

struct HueView: View {
    //init과 body는 별도로 동작하고 body는 실행되지 않음
    init() {    //인스턴스가 계속 그려짐, 네트워크 통신을 init 구문에 넣으면...
        print("HueView init")
    }
    var body: some View {   //연산 프로퍼티는 메모리에 바로 올라가지 않음, 변경되는 게 없어서(실행되지 않음) 렌더링되지 않음
        Text("Hue")
            .background(Color.random())
    }
}


extension Color {
    
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
    
}
