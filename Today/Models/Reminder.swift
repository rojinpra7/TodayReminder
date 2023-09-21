//
//  Reminder.swift
//  Today
//
//  Created by Rojin Prajapati on 5/8/23.
//

import Foundation

struct Reminder: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension [Reminder] {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: {$0.id == id}) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Leetcode 1hour", dueDate: Date().addingTimeInterval(800.0), notes: "Learn 1 algorithm everyday"),
        Reminder(title: "Ball workout", dueDate: Date().addingTimeInterval(12000.0), notes: "Improve your first touch to direction"),
        Reminder(title: "Interview Preparation", dueDate: Date().addingTimeInterval(1400000.0), notes: "Record and rehearse", isComplete: true),
        Reminder(title: "Eat 3 proper meals", dueDate: Date().addingTimeInterval(1000.0), notes: "Include proteinshake"),
        Reminder(title: "Read book for an hour", dueDate: Date().addingTimeInterval(120000.0), notes: "Dont use your phone"),
        Reminder(title: "Go to bed before midnight", dueDate: Date().addingTimeInterval(1300.0), notes: "No screen time after 11pm", isComplete: true),
    ]
}
#endif
