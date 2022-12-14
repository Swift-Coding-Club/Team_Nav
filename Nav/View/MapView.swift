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
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: false,
                    annotationItems: mockDatas){
                    data in MapMarker(coordinate: data.coordinate)
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Button(action: {}) {
                            Image(systemName: "gearshape")
                                .circleButton(
                                    iconColor: .navWhite,
                                    iconWidth: 20,
                                    iconHeight: 20,
                                    buttonColor: .primaryRed,
                                    buttonSize: 50,
                                    shadowRadius: 4,
                                    shadowY: 4
                                )
                                .shadow(radius: 4, y: 4)
                        }
                        
                        NavigationLink {
                            ListView()
                        } label: {
                            Image(systemName: "list.bullet")
                                .circleButton(
                                    iconColor: .navWhite,
                                    iconWidth: 20,
                                    iconHeight: 14.5,
                                    buttonColor: .primaryRed,
                                    buttonSize: 50,
                                    shadowRadius: 4,
                                    shadowY: 4
                                )
                                .shadow(radius: 4, y: 4)
                        }
                        
                        Spacer()
                        
                        if isLoggedIn {
                            NavigationLink {
                                PinCreationView()
                            } label: {
                                Image(systemName: "plus")
                                    .circleButton(
                                        iconColor: .navWhite,
                                        iconWidth: 17,
                                        iconHeight: 16,
                                        buttonColor: .primaryRed,
                                        buttonSize: 50,
                                        shadowRadius: 4,
                                        shadowY: 4
                                    )
                                    .shadow(radius: 4, y: 4)
                            }
                        } else {
                            Button {
                                isClickedYes = true
                            } label: {
                                Image(systemName: "plus")
                                    .circleButton(
                                        iconColor: .navWhite,
                                        iconWidth: 17,
                                        iconHeight: 16,
                                        buttonColor: .primaryRed,
                                        buttonSize: 50,
                                        shadowRadius: 4,
                                        shadowY: 4
                                    )
                                    .shadow(radius: 4, y: 4)
                            }
                        }
                    }
                    .padding(.trailing, 16)
                }
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
