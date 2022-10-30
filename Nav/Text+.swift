//
//  Text+.swift
//  Nav
//
//  Created by 김민택 on 2022/10/30.
//

import SwiftUI

extension Text {
    func display5() -> some View {
        self
            .font(.display5)
            .kerning(-0.6)
            .lineSpacing(12)
    }
    
    func display4() -> some View {
        self
            .font(.display4)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func display3() -> some View {
        self
            .font(.display3)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func display2() -> some View {
        self
            .font(.display2)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func display1() -> some View {
        self
            .font(.display1)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func headline() -> some View {
        self
            .font(.headline)
            .kerning(-0.6)
            .lineSpacing(8)
    }
    
    func subhead3() -> some View {
        self
            .font(.subhead3)
            .kerning(-0.6)
            .lineSpacing(6)
    }
    
    func subheadLong3() -> some View {
        self
            .font(.subhead3)
            .kerning(-0.6)
            .lineSpacing(12)
    }
    
    func subhead2() -> some View {
        self
            .font(.subhead2)
            .kerning(-0.6)
            .lineSpacing(6)
    }
    
    func subheadLong2() -> some View {
        self
            .font(.subhead2)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func subhead1() -> some View {
        self
            .font(.subhead1)
            .kerning(-0.6)
            .lineSpacing(6)
    }
    
    func body2() -> some View {
        self
            .font(.body2)
            .kerning(-0.6)
            .lineSpacing(8)
    }
    
    func bodyLong2() -> some View {
        self
            .font(.body2)
            .kerning(-0.6)
            .lineSpacing(12)
    }
    
    func body1() -> some View {
        self
            .font(.body1)
            .kerning(-0.6)
            .lineSpacing(6)
    }
    
    func bodyLong1() -> some View {
        self
            .font(.body1)
            .kerning(-0.6)
            .lineSpacing(10)
    }
    
    func caption() -> some View {
        self
            .font(.caption)
            .kerning(-0.6)
            .lineSpacing(6)
    }
}
