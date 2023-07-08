//
//  ContentView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        TabView {
            MapView()
                .environmentObject(locationManager)
                .tabItem {
                    Image(systemName: "map")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            
            PinCreationView()
                .environmentObject(locationManager)
                .tabItem {
                    Image(systemName: "plus")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView().environmentObject(LocationManager())
//        ContentView()
    }
}
