//
//  UIColorExtension.swift
//  Tnex messenger
//
//  Created by Din Vu Dinh on 28/02/2022.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        self.init(hex: hex, a: 1.0)
    }
    
    convenience init(hex: Int, a: CGFloat) {
        self.init(r: (hex >> 16) & 0xff, g: (hex >> 8) & 0xff, b: hex & 0xff, a: a)
    }
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(r: r, g: g, b: b, a: 1.0)
    }
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    
    convenience init?(hexString: String) {
        var hexString = hexString.replacingOccurrences(of: "#", with: "")
        if hexString.count == 3 {
            hexString += hexString
        }
        guard let hex = hexString.toHex() else { return nil }
        self.init(hex: hex)
    }
    
    static func fromHex(_ hexString: String) -> UIColor {
        return UIColor(hexString: hexString) ?? .clear
    }
    
    convenience init(hex: String) {
        var hexString = hex.replacingOccurrences(of: "#", with: "")
        if hexString.count == 3 {
            hexString += hexString
        }
        guard let hex = hexString.toHex() else {
            self.init(hex: 0)
            return
        }
        self.init(hex: hex)
    }
    
    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    static let darkDefault = UIColor(white: 45.0/255.0, alpha: 1)
    static let grayText = UIColor(white: 160.0/255.0, alpha: 1)
    static let facebookDarkBlue = UIColor.by(r: 59, g: 89, b: 152)
    static let dimmedLightBackground = UIColor(white: 100.0/255.0, alpha: 0.3)
    static let dimmedDarkBackground = UIColor(white: 50.0/255.0, alpha: 0.3)
    static let pinky = UIColor(rgb: 0xE91E63)
    static let amber = UIColor(rgb: 0xFFC107)
    static let satCyan = UIColor(rgb: 0x00BCD4)
    static let darkText = UIColor(rgb: 0x212121)
    static let redish = UIColor(rgb: 0xFF5252)
    static let darkSubText = UIColor(rgb: 0x757575)
    static let greenGrass = UIColor(rgb: 0x4CAF50)
    static let darkChatMessage = UIColor(red: 48, green: 47, blue: 48)
    static let buttonBackground = UIColor(red: 0.078, green: 0.784, blue: 0.98, alpha: 0.2)
}
