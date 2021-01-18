//
//  ViewController.swift
//  AttributedTextURLExamples
//
//  Created by Jade Silveira on 17/01/21.
//

import UIKit
import AttributedTextURL

protocol Displaying: AnyObject {
    func setAttributedText(with attributedText: NSMutableAttributedString)
    func setAttributedTextOfMultipleLinks(with attributedText: NSMutableAttributedString)
}

final class ViewController: UIViewController {
    let interactor: Interacting
    
    private lazy var textView: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.isSelectable = true
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var textViewMultipleLinks: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.isSelectable = true
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    init(interactor: Interacting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        buildHierarchy()
        setupContraints()
        
        setupAttributedText()
        setupMultipleLinksTextAttributes()
    }
    
    func configureView() {
        view.backgroundColor = UIColor.white
    }
    
    func buildHierarchy() {
        view.addSubview(textView)
        view.addSubview(textViewMultipleLinks)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            textViewMultipleLinks.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            textViewMultipleLinks.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textViewMultipleLinks.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textViewMultipleLinks.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupAttributedText() {
        interactor.setupAttributedText()
        textView.delegate = self
        textView.linkTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
    }
    
    func setupMultipleLinksTextAttributes() {
        interactor.setupAttributedTextMultipleLinks()
        textViewMultipleLinks.delegate = self
        textViewMultipleLinks.linkTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.blue,
        ]
    }
}

extension ViewController: UITextViewDelegate {
    func textView(
        _ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange,
        interaction: UITextItemInteraction
    ) -> Bool {
        interactor.showLinkRedirect(url: URL)
        return false
    }
}

extension ViewController: Displaying {
    func setAttributedText(with attributedText: NSMutableAttributedString) {
        textView.attributedText = attributedText
    }
    
    func setAttributedTextOfMultipleLinks(with attributedText: NSMutableAttributedString) {
        textViewMultipleLinks.attributedText = attributedText
    }
}
