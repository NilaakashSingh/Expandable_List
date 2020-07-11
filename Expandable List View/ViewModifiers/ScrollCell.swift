//
//  ScrollCell.swift
//  Expandable List View
//
//  Copyright © MITLicense. All rights reserved.
//

import SwiftUI

struct ScrollCell: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }.offset(x: 20)
    }
}
