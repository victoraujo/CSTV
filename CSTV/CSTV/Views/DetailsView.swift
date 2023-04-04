//
//  DetailsView.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var firstViewModel = TeamsViewModel()
    @ObservedObject var secondViewModel = TeamsViewModel()
    @StateObject var leftImageManager = ImageManager()
    @StateObject var rightImageManager = ImageManager()
    let match: Match
    let firstTeamId: Int
    let secondTeamId: Int

    init(match: Match) {
        self.match = match
        guard let firstOpponentId = match.opponents?.first?.opponent?.id, let secondOpponent = match.opponents?.last?.opponent?.id else {
            firstTeamId = 0
            secondTeamId = 0
            return
        }
        firstTeamId = firstOpponentId
        secondTeamId = secondOpponent
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    VStack {
                        Image(uiImage: leftImageManager.image ?? UIImage())
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
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
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .clipShape(Circle())
                        Text(match.opponents?.last?.opponent?.name ?? "Team 2")
                            .font(.teamFont)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 24)
                Text(TimeFormatter().getDate(dateString: match.beginAt, status: match.status))
                    .font(.timeDetailsFont)
                    .foregroundColor(.white)
                    .padding([.top, .bottom], 20)
                HStack(alignment: .center, spacing: 0) {
                    LazyVStack {
                        ForEach(firstViewModel.teams.first?.players ?? [], id: \.self) { player in
                            LeftPlayerView(player: player)}
                    }
                        .padding(.trailing, 6.5)
                    LazyVStack {
                        ForEach(secondViewModel.teams.first?.players ?? [], id: \.self) { player in
                            RightPlayerView(player: player)}
                    }
                        .padding(.leading, 6.5)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.backgroundColor)}
        .navigationTitle(match.league?.name ?? "" + (match.serie?.name ?? "")).font(.headingDetailsFont)
        .navigationBarBackButtonHidden(true)
        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    dismiss()
                                } label: {
                                    Image("leftArrow")
                                        .padding(.leading, 8)
                                }
                            }
        } . onAppear {
            firstViewModel.getDetailsData(id: firstTeamId)
            secondViewModel.getDetailsData(id: secondTeamId)
            leftImageManager.loadImage(fromURL: match.opponents?.first?.opponent?.imageUrl ?? "")
            rightImageManager.loadImage(fromURL: match.opponents?.last?.opponent?.imageUrl ?? "")
        }
    }
}
