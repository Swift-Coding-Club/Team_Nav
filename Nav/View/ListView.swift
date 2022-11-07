//
//  ListView.swift
//  Nav
//
//  Created by shingyuuser on 2022/11/06.
//

import SwiftUI

struct ListView: View {
    private var mockDatas: [MockDatum] = MockDatum.allData
    
    var body: some View {
        NavigationView {
            List{
                ForEach(mockDatas, id: \.id) {
                    mockDatum in
                    Text("\(mockDatum.title.rawValue)")
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
