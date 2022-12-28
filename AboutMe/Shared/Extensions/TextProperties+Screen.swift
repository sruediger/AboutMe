//
//  TextProperties+Screen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension TextProperties where Self: Screen {
    var titleFont: FontStyle { smallPhone ? .subheadline : .title3 }
    var contentFont: FontStyle { smallPhone ? .footnote : .subheadline }
}
