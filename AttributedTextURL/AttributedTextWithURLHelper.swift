//
//  AttributedTextWithURLHelper.swift
//  AttributedTextURL
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation
import UIKit

public enum AttributedTextWithURLHelper {
    public static func getAttributedStringWithSingleURL(
        text: String,
        styleAttributes: [NSAttributedString.Key: Any],
        link: LinkInfo
    ) -> NSMutableAttributedString {
        let formattedText = String(format: text, link.text)
        let attributedText = NSMutableAttributedString(string: formattedText, attributes: styleAttributes)
        
        guard let urlAddress = URL(string: link.urlAddress) else {
            return attributedText
        }
        
        let linkRange = NSString(string: formattedText).range(of: link.text)
        attributedText.addAttribute(.link, value: urlAddress, range: linkRange)
        return attributedText
    }
    
    public static func getAttributedStringWithMultipleURLs(
        text: String,
        styleAttributes: [NSAttributedString.Key: Any],
        multipleLinks: [LinkInfo]
    ) -> NSMutableAttributedString {
        let formattedFullText = String(format: text, arguments: multipleLinks.map { $0.text as CVarArg })
        let attributedText = NSMutableAttributedString(string: formattedFullText, attributes: styleAttributes)
        
        for link in multipleLinks {
            guard let urlAddress = URL(string: link.urlAddress) else {
                return attributedText
            }
            
            let linkRange = NSString(string: formattedFullText).range(of: link.text)
            attributedText.addAttribute(.link, value: urlAddress, range: linkRange)
        }
        return attributedText
    }
}
