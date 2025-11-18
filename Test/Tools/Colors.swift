//
//  Colors.swift
//  Test
//
//  Created by 郝玉鸿 on 2025/11/18.
//

import UIKit

public func rgbHexColor(_ h:Int) -> UIColor {
    return rgbaHexColor(h, 1)
}

public func rgbaHexColor(_ h:Int, _ a:CGFloat) -> UIColor {
    return rgbaColor((((h)>>16)&0xFF), (((h)>>8)&0xFF), ((h)&0xFF), a)
}

public func rgbColor(_ r:Int, _ g: Int, _ b: Int) -> UIColor {
    return rgbaColor(r, g, b, 1)
}

public func rgbaColor(_ r:Int,_ g: Int, _ b: Int, _ a: CGFloat) -> UIColor {
    return UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b)/255.0, alpha: a)
}

public func rgbPureColor(_ h:Int) -> UIColor {
    return rgbColor(h, h, h)
}
