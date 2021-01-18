//
//  Presenter.swift
//  AttributedTextURLExamples
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation
import AttributedTextURL
import UIKit

protocol Presenting: AnyObject {
    var viewController: Displaying? { get set }
    func setupAttributedText()
    func setupAttributedTextMultipleLinks()
    func nextStep(action: CoordinatorAction)
}

final class Presenter: Presenting {
    weak var viewController: Displaying?
    let coordinator: Coordinating
    
    init(coordinator: Coordinating) {
        self.coordinator = coordinator
    }
    
    func setupAttributedText() {
        guard let urlAddress = URL(string: "https://github.com/dejacs") else {
            return
        }
        
        let attributedText = AttributedTextWithURLHelper.getAttributedTextWithURL(
            text: "Para mais informações, visite o github.",
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black,
                .paragraphStyle: NSMutableParagraphStyle()
            ],
            link: LinkText(text: "github", urlAddress: urlAddress)
        )
        viewController?.setAttributedText(with: attributedText)
    }
    
    func setupAttributedTextMultipleLinks() {
        guard
            let gitUrlAddress = URL(string: "https://github.com/dejacs"),
            let mediumUrlAddress = URL(string: "https://jadecsilveira.medium.com/")
        else {
            return
        }
        
        let attributedText = AttributedTextWithURLHelper.getAttributedTextWithMultipleURLs(
            text: "Para mais informações, visite o github ou o medium.",
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black,
                .paragraphStyle: NSMutableParagraphStyle()
            ],
            multipleLinks: [
                LinkText(text: "github", urlAddress: gitUrlAddress),
                LinkText(text: "medium", urlAddress: mediumUrlAddress)
            ]
        )
        viewController?.setAttributedTextOfMultipleLinks(with: attributedText)
    }
    
    func nextStep(action: CoordinatorAction) {
        coordinator.nextStep(action: action)
    }
}
