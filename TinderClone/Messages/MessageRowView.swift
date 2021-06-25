//
//  MessageRowView.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                Text(preview.lastMessage)
                    .foregroundColor(Color.textPrimary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }

    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageRowView(preview: MessagePreview.example)
        }
    }
}
