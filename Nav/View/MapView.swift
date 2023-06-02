//
//  MapView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//
import MapKit
import SwiftUI
struct MapView: View {
    @ObservedObject var addressSearcher = AddressSearcher()
    @State var isEditing = false

    // 서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    private var mockDatas: [MockDatum] = MockDatum.allData

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: false,
                    annotationItems: mockDatas){
                    data in MapMarker(coordinate: data.coordinate)
                }

                if isEditing {
                    List(addressSearcher.completions) { completion in
                        Button {
                            addressSearcher.loadAddressCoordinate(completion) { coordinate in
                                region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                            }
                            addressSearcher.searchQuery = ""
                        } label: {
                            VStack(alignment: .leading) {
                                Text(completion.title)
                                if completion.subtitle != "" {
                                    Text(completion.subtitle)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("NAV")
            .searchable(
                text: $addressSearcher.searchQuery,
                placement: .navigationBarDrawer,
                prompt: "검색"
            )
            .onChange(of: addressSearcher.searchQuery) { newValue in
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
