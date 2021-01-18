//
//  Interactor.swift
//  AttributedTextURLExamples
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation
import AttributedTextURL

protocol Interacting: AnyObject {
    func setupAttributedText()
    func setupAttributedTextMultipleLinks()
    func showLinkRedirect(url: URL)
}

final class Interactor: Interacting {
    let presenter: Presenting
    
    init(presenter: Presenting) {
        self.presenter = presenter
    }
    
    func setupAttributedText() {
        presenter.setupAttributedText()
    }
    
    func setupAttributedTextMultipleLinks() {
        presenter.setupAttributedTextMultipleLinks()
    }
    
    func showLinkRedirect(url: URL) {
        presenter.nextStep(action: .open(url: url))
    }
}
