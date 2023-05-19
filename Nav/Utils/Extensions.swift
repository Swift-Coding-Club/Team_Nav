//
//  Extensions.swift
//  Nav
//
//  Created by Taewan Kim on 2023/05/19.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil )
    }
}
