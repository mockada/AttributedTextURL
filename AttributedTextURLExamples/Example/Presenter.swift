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
    enum SimpleText: String {
        case singleLink = "Para mais informações, visite o %@."
        case multipleLinks = "Para mais informações, visite o %@ ou o %@."
    }
    enum LinkText: String {
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
        let attributedText = AttributedTextWithURLHelper.getAttributedStringWithSingleURL(
            text: Constants.SimpleText.singleLink.rawValue,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            link: LinkInfo(text: Constants.LinkText.git.rawValue, urlAddress: Constants.UrlAddress.git.rawValue)
        )
        viewController?.setAttributedText(with: attributedText)
    }
    
    func setupAttributedTextMultipleLinks() {
        let attributedText = AttributedTextWithURLHelper.getAttributedStringWithMultipleURLs(
            text: Constants.SimpleText.multipleLinks.rawValue,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            multipleLinks: [
                LinkInfo(text: Constants.LinkText.git.rawValue, urlAddress: Constants.UrlAddress.git.rawValue),
                LinkInfo(text: Constants.LinkText.medium.rawValue, urlAddress: Constants.UrlAddress.medium.rawValue)
            ]
        )
        viewController?.setAttributedTextOfMultipleLinks(with: attributedText)
    }
    
    func showLinkRedirect(url: URL) {
        coordinator.nextStep(action: .open(url: url))
    }
}
