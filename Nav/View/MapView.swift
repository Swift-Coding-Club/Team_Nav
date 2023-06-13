//
//  MapView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/26.
//
import MapKit
import SwiftUI
struct MapView: View {
    @StateObject var locationManager = LocationManager()

    // 서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    private var mockDatas: [MockDatum] = MockDatum.allData

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: false,
                    annotationItems: mockDatas) {
                    data in MapMarker(coordinate: data.coordinate)
                }
                SearchedView(region: $region)
                    .environmentObject(locationManager)
            }
            .navigationTitle("NAV")
            .searchable(
                text: $locationManager.searchQuery,
                placement: .navigationBarDrawer,
                prompt: "검색"
            )
        }
    }
}

private struct SearchedView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Binding var region: MKCoordinateRegion
    @Environment(\.isSearching) private var isSearching
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        if isSearching {
            List(locationManager.completions) { completion in
                Button {
                    locationManager.loadAddressCoordinate(completion) { location in
                        withAnimation {
                            region = location
                        }
                    }
                    dismissSearch()
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
