//
//  MatchCardView.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import SwiftUI

struct MatchCardView: View {
    @StateObject var leagueImageManager = ImageManager()
    @StateObject var leftImageManager = ImageManager()
    @StateObject var rightImageManager = ImageManager()
    let match: Match

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.cardColor)
            
            VStack(spacing: 0) {
                HStack {
                    Text(TimeFormatter().getDate(dateString: match.beginAt, status: match.status))
                        .foregroundColor(.white)
                        .font(Font.custom("Roboto-Bold", size: 8))
                        .padding(8)
                        .background(
                            Rectangle()
                                .foregroundColor(match.status == .running ? .nowColor : .white20)
                                .cornerRadius(16, corners: [.bottomLeft, .topRight])
                        )
                } .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer(minLength: 18.5)
                HStack(alignment: .center, spacing: 0) {
                    VStack() {
                        Image(uiImage: leftImageManager.image ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        Text(match.opponents?.first?.opponent?.name ?? "Team 1")
                            .font(.teamFont)
                            .foregroundColor(.white)
                    }
                    Text("vs")
                        .font(.vsFont)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                    VStack() {
                        Image(uiImage: rightImageManager.image ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        Text(match.opponents?.last?.opponent?.name ?? "Team 2")
                            .font(.teamFont)
                            .foregroundColor(.white)
                    }
                }
                Spacer(minLength: 18.5)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.white20)
                HStack {
                    Image(uiImage: leagueImageManager.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .clipShape(Circle())
                        .padding(.leading, 15)
                    Text(match.league?.name ?? "" + (match.serie?.name ?? ""))
                        .font(.leagueFont)
                        .foregroundColor(.white)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .top], 8)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }.frame(maxWidth: 350, minHeight: 220,maxHeight: 220, alignment: .center)
            .onAppear {
                leagueImageManager.loadImage(fromURL: match.league?.imageUrl ?? "")
                leftImageManager.loadImage(fromURL: match.opponents?.first?.opponent?.imageUrl ?? "")
                rightImageManager.loadImage(fromURL: match.opponents?.last?.opponent?.imageUrl ?? "")
            }
    }
}
