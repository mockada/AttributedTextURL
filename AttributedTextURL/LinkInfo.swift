//
//  LinkInfo.swift
//  AttributedTextURL
//
//  Created by Jade Silveira on 17/01/21.
//

import Foundation

public struct LinkInfo {
    let text: String
    let urlAddress: URL
    
    public init(text: String, urlAddress: URL) {
        self.text = text
        self.urlAddress = urlAddress
    }
}
