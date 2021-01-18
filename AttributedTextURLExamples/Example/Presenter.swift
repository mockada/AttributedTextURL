//
//  Presenter.swift
//  AttributedTextURLExamples
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation
import AttributedTextURL
import UIKit

enum Constants {
    enum UrlAddress: String {
        case git = "https://github.com/dejacs"
        case medium = "https://jadecsilveira.medium.com/"
    }
    enum TextViewFullText: String {
        case singleLink = "Para mais informações, visite o GitHub."
        case multipleLinks = "Para mais informações, visite o GitHub ou o Medium."
    }
    enum TextViewLinkText: String {
        case git = "GitHub"
        case medium = "Medium"
    }
}

protocol Presenting: AnyObject {
    var viewController: Displaying? { get set }
    func setupAttributedText()
    func setupAttributedTextMultipleLinks()
    func showLinkRedirect(url: URL)
}

final class Presenter: Presenting {
    weak var viewController: Displaying?
    let coordinator: Coordinating
    
    init(coordinator: Coordinating) {
        self.coordinator = coordinator
    }
    
    func setupAttributedText() {
        guard let urlAddress = URL(string: Constants.UrlAddress.git.rawValue) else {
            return
        }
        
        let attributedText = AttributedTextWithURLHelper.getAttributedTextWithURL(
            text: Constants.TextViewFullText.singleLink.rawValue,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            link: LinkInfo(text: Constants.TextViewLinkText.git.rawValue, urlAddress: urlAddress)
        )
        viewController?.setAttributedText(with: attributedText)
    }
    
    func setupAttributedTextMultipleLinks() {
        guard
            let gitUrlAddress = URL(string: Constants.UrlAddress.git.rawValue),
            let mediumUrlAddress = URL(string: Constants.UrlAddress.medium.rawValue)
        else {
            return
        }
        
        let attributedText = AttributedTextWithURLHelper.getAttributedTextWithMultipleURLs(
            text: Constants.TextViewFullText.multipleLinks.rawValue,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            multipleLinks: [
                LinkInfo(text: Constants.TextViewLinkText.git.rawValue, urlAddress: gitUrlAddress),
                LinkInfo(text: Constants.TextViewLinkText.medium.rawValue, urlAddress: mediumUrlAddress)
            ]
        )
        viewController?.setAttributedTextOfMultipleLinks(with: attributedText)
    }
    
    func showLinkRedirect(url: URL) {
        coordinator.nextStep(action: .open(url: url))
    }
}
