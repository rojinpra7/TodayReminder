//
//  CAGradientLayer+ListStyle.swift
//  Today
//
//  Created by Rojin Prajapati on 6/28/23.
//

import UIKit

extension CAGradientLayer {
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            beginColor = .todayGradientAllBegin
            endColor = .todayGradientAllEnd
        case .today:
            beginColor = .todayGradientTodayBegin
            endColor = .todayGradientTodayEnd
        case .future:
            beginColor = .todayGradientFutureBegin
            endColor = .todayGradientFutureEnd
        }
        
        return [beginColor.cgColor, endColor.cgColor]
    }
    
    static func gradientLayer(for style: ReminderListStyle,in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
}
