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
    @State var isEditing = false

    // 서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var isLoggedIn: Bool = true
    @State private var isClickedYes: Bool = false
    @State private var isShowModal: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: false,
                    annotationItems: mockDatas){
                    data in MapMarker(coordinate: data.coordinate)
                }

                if isEditing {
                    List {
                        Text(searchQueryString)
                    }
                }
            }
            .navigationTitle("NAV")
            .searchable(
                text: $searchQueryString,
                placement: .navigationBarDrawer,
                prompt: "검색"
            )
            .onChange(of: searchQueryString) { newValue in
                isEditing = (newValue != "" ? true : false)
            }
        }
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
