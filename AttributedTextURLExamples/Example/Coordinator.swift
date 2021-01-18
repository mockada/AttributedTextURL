//
//  Coordinator.swift
//  AttributedTextURLExamples
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation
import SafariServices

enum CoordinatorAction {
    case open(url: URL)
}

protocol Coordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func nextStep(action: CoordinatorAction)
}

final class Coordinator: Coordinating {
    weak var viewController: UIViewController?
    
    func nextStep(action: CoordinatorAction) {
        if case .open(let url) = action {
            let safariViewController = SFSafariViewController(url: url)
            viewController?.present(safariViewController, animated: true)
        }
    }
}
