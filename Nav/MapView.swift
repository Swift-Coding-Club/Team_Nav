//
//  MapView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    // 서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .fill(.red)
                            )
                            .shadow(radius: 4, y: 4)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 20, height: 14.5)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .fill(.red)
                            )
                            .shadow(radius: 4, y: 4)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 17, height: 16)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .fill(.red)
                            )
                            .shadow(radius: 4, y: 4)
                    }
                }
                .padding(.trailing, 16)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
