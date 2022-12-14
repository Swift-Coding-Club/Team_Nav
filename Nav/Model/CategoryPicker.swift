//
//  CategoryPicker.swift
//  Nav
//
//  Created by Seulki Lee on 2022/11/21.
//

import SwiftUI

struct CategoryPicker: View {
    var arrCategory = ["음식", "장소", "이벤트"]
    
    @Binding var categoryDataBinding: String
    var body: some View {
        VStack {
            Picker("Choose a color", selection: $categoryDataBinding) {
                ForEach(arrCategory, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            .cornerRadius(10)
        }
    }
}


