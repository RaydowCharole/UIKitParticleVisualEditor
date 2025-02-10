//
//  PanelTitle.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

struct PanelTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .frame(alignment: .leading)

            Spacer()
        }
    }
}
