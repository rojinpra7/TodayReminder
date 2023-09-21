//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Rojin Prajapati on 5/13/23.
//

import UIKit

extension ReminderViewController {
    
    enum Row: Hashable {
        case header(String)
        case date
        case notes
        case time
        case title
        case editableText(String?)
        case editableDate(Date)
        
        var imageName: String? {
            switch self {
            case .date: return "calendar.badge.clock"
            case .notes: return "square.and.pencil.circle"
            case .time: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName = imageName else { return nil}
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
        
        
    }
    
    
}
