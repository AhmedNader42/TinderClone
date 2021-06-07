//
//  RoundedImage.swift
//  TinderClone
//
//  Created by ahmed on 07/06/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
    var url: URL?
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
