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
                        
                        Button {
                            if isLoggedIn {
                                isShowModal = true
                            } else {
                                isClickedYes = true
                            }
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
                    .padding(.trailing, 16)
                    .alert("로그인이 필요한 서비스입니다.",
                           isPresented: $isClickedYes,
                           actions: {
                            Button("취소", role: .cancel, action: {})
                            Button("로그인", role: .none, action: {})
                        },
                           message: {
                            Text("로그인을 하시면 모든 서비스를 이용하실 수 있습니다. 로그인 하시겠습니까?")
                        }
                    )
                    .sheet(isPresented: $isShowModal) {
                        NavigationView {
                            VStack {
                                PinCreationView()
                            }
                            .padding(16)
                            .navigationTitle("핀 추가")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        isShowModal = false
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
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
