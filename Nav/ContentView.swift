//
//  ContentView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Image(systemName: "map")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            
            PinCreationView()
                .tabItem {
                    Image(systemName: "plus")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
