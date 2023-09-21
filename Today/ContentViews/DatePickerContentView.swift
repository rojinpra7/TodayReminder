//
//  DatePickerContentView.swift
//  Today
//
//  Created by Rojin Prajapati on 6/5/23.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    
    struct Configuration: UIContentConfiguration {
        var date = Date.now
        var onChange: (Date) -> Void = {_ in }
        
        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
        
    }
    
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    let datePicker = UIDatePicker()

    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubView(datePicker)
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(didPick(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration){
        guard let configuration = configuration as? Configuration else { return }
        datePicker.date = configuration.date
        
    }
    
    @objc private func didPick(_ sender: UIDatePicker){
        guard let configuration = configuration as? DatePickerContentView.Configuration else { return }
        configuration.onChange(sender.date)
    }
}

extension UICollectionViewListCell {
    func datePickerConfiguration() ->DatePickerContentView.Configuration {
        DatePickerContentView.Configuration()
        
    }
}

