//
//  ColorExtension.swift
//  CSTV
//
//  Created by Victor Vieira on 03/04/23.
//

import SwiftUI

extension Color {
    static var backgroundColor: Color {
        Color("backgroundColor")
    }
    static var cardColor: Color {
        Color("cardColor")
    }
    static var defaultColor: Color {
        Color("defaultColor")
    }
    static var nowColor: Color {
        Color("nowColor")
    }
    static var white20: Color {
        Color("white20")
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
