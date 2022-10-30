//
//  Font+.swift
//  Nav
//
//  Created by 김민택 on 2022/10/29.
//

import SwiftUI

extension Font {
    static func appTitle(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .bold)
    }
    
    static func appBody(size: CGFloat) -> Font {
        return Font.system(size: size, weight: .regular)
    }
    
    static let display5 = appTitle(size: 40)
    static let display4 = appTitle(size: 36)
    static let display3 = appTitle(size: 32)
    static let display2 = appTitle(size: 28)
    static let display1 = appTitle(size: 24)
    static let headline = appTitle(size: 20)
    static let subhead3 = appTitle(size: 16)
    static let subhead2 = appTitle(size: 14)
    static let subhead1 = appTitle(size: 12)
    
    static let body2 = appBody(size: 16)
    static let body1 = appBody(size: 14)
    static let caption = appBody(size: 12)
}
