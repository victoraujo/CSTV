//
//  RightPlayerView.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import SwiftUI

struct RightPlayerView: View {
    @StateObject var imageManager = ImageManager()
    let player: Player

    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(12, corners: [.topLeft, .bottomLeft])
                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.22))
            HStack(spacing: 0) {
                Image(uiImage: imageManager.image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48.5, height: 48.5)
                    .cornerRadius(8)
                    .padding(.leading, 12)
                    .offset(y: -5.25)
                VStack(alignment: .leading, spacing: 0){
                    Text(player.name ?? "")
                        .font(.nicknameFont)
                        .foregroundColor(.white)
                    Text(player.firstName ?? "" + (player.lastName ?? ""))
                        .font(.vsFont)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 16)
            } .frame(maxWidth: .infinity, alignment: .leading)
        }.frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54)
            . onAppear {
                imageManager.loadImage(fromURL: player.imageUrl ?? "")
            }
    }
}
