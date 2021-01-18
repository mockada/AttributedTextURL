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
        guard let urlAddress = URL(string: Constants.UrlAddress.git.rawValue) else {
            return
        }
        
        let formattedFullText = String(
            format: Constants.SimpleText.singleLink.rawValue,
            Constants.LinkText.git.rawValue
        )
        
        let attributedText = AttributedTextWithURLHelper.getAttributedStringWithSingleURL(
            text: formattedFullText,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            link: LinkInfo(text: Constants.LinkText.git.rawValue, urlAddress: urlAddress)
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
        
        let formattedFullText = String(
            format: Constants.SimpleText.multipleLinks.rawValue,
            Constants.LinkText.git.rawValue,
            Constants.LinkText.medium.rawValue
        )
        
        let attributedText = AttributedTextWithURLHelper.getAttributedStringWithMultipleURLs(
            text: formattedFullText,
            styleAttributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ],
            multipleLinks: [
                LinkInfo(text: Constants.LinkText.git.rawValue, urlAddress: gitUrlAddress),
                LinkInfo(text: Constants.LinkText.medium.rawValue, urlAddress: mediumUrlAddress)
            ]
        )
        viewController?.setAttributedTextOfMultipleLinks(with: attributedText)
    }
    
    func showLinkRedirect(url: URL) {
        coordinator.nextStep(action: .open(url: url))
    }
}
