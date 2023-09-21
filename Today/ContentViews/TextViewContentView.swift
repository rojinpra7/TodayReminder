//
//  TextViewContentView.swift
//  Today
//
//  Created by Rojin Prajapati on 6/5/23.
//

import UIKit

class TextViewContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onChange: (String) -> Void = {_ in }
        
        func makeContentView() -> UIView & UIContentView {
            return TextViewContentView(self)
        }
        
    }
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    let textView = UITextView()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubView(textView, height:200)
        textView.backgroundColor = nil
        textView.delegate = self
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration){
        guard let configuration = configuration as? Configuration else { return }
        textView.text = configuration.text
        
    }
    
    private func didChange(_ sender: UITextView){
        var configuration = configuration as? Configuration
    }
}

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
        
    }
}

extension TextViewContentView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let configuration = configuration as? TextViewContentView.Configuration else { return }
        configuration.onChange(textView.text)
    }
}

