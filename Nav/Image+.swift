//
//  Image+.swift
//  Nav
//
//  Created by 김민택 on 2022/10/30.
//

import SwiftUI

extension Image {
    func circleButton(iconColor: Color, iconWidth: CGFloat, iconHeight: CGFloat, buttonColor: Color, buttonSize: CGFloat, shadowColor: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), shadowRadius: CGFloat = 0, shadowX: CGFloat = 0, shadowY: CGFloat = 0) -> some View {
        var iconSize: CGFloat
        
        if iconWidth >= iconHeight {
            iconSize = iconHeight
        } else {
            iconSize = iconWidth
        }
        
        return self
            .resizable()
            .frame(width: iconWidth, height: iconHeight)
            .foregroundColor(iconColor)
            .padding((buttonSize - iconSize) / 2)
            .background(
                Circle()
                    .fill(buttonColor)
                    .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
            )
    }
}
