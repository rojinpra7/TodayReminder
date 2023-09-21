//
//  TodayError.swift
//  Today
//
//  Created by Rojin Prajapati on 6/28/23.
//

import Foundation

enum TodayError: LocalizedError {
    case failedReadingReminders
    case failedReadingCalendarItem
    case reminderHasNoDueDate
    case accessDenied
    case accessRestricted
    case unknown

    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        case .failedReadingCalendarItem:
            return NSLocalizedString("Failed to read a calendar item.", comment: "failed reading calendar item error description")
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date.", comment: "reminder has no due date error description")
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permission to read reminders.", comment: "access denied error description")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders.", comment: "acess restricted error description")
        case .unknown:
            return NSLocalizedString("An unknown error occurred.", comment: "unknown error description")
        }
    
    }
    
    
}
