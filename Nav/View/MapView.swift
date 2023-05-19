//
//  MapView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//

import MapKit
import SwiftUI

struct MapView: View {
    private var mockDatas: [MockDatum] = MockDatum.allData
    
    @State var searchQueryString = ""
    
    // 서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region,
                showsUserLocation: false,
                annotationItems: mockDatas){
                data in MapMarker(coordinate: data.coordinate)
            }
            .navigationTitle("NAV")
            .searchable(
                text: $searchQueryString,
                placement: .navigationBarDrawer,
                prompt: "검색"
            )
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
