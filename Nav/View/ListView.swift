//
//  ListView.swift
//  Nav
//
//  Created by shingyuuser on 2022/11/06.
//

import MapKit
import SwiftUI

struct ListView: View {
    private var mockDatas: [MockDatum] = MockDatum.allData
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State var searchText = ""
    @State var inSearchMode = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Nav")
                .font(.system(size: 40,weight: .semibold))
                .padding(EdgeInsets(top: 0, leading: 30, bottom: -10, trailing: 0))
            
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            Map(coordinateRegion: $region,
                showsUserLocation: false,
                annotationItems: mockDatas){
                data in MapMarker(coordinate: data.coordinate)
            }
            
            Text("주소 리스트")
                .font(.system(size: 20,weight: .semibold))
                .padding(EdgeInsets(top: 0, leading: 150, bottom: 8, trailing: 0))
            HStack {
                Text("카페")
                    .font(.system(size: 16,weight: .semibold))
                    .foregroundColor(.indigo)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                Spacer()
                Text("최신순")
                    .font(.system(size: 16,weight: .semibold))
                    .foregroundColor(.blue)
                Image(systemName: "arrow.down.square")
                    .foregroundColor(.blue)
                    .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: 20))
            }
            
            List{
                ForEach(mockDatas, id: \.id) {
                    mockDatum in
                    HStack{
                        Image(systemName: "cup.and.saucer")
                            .foregroundColor(.redBean)
                        Text("\(mockDatum.title.rawValue)")
                            .font(.system(size: 15))
                            .swipeActions {
                                Button(role: .destructive) {
                                    // code
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
