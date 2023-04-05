//
//  ContentView.swift
//  CSTV
//
//  Created by Victor Vieira on 31/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MatchesViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("Partidas")
                        .foregroundColor(.white)
                        .font(.headingFont)
                        .padding([.leading, .bottom], 24)
                } . frame(maxWidth: .infinity, alignment: .leading)
                ScrollView {
                    VStack(spacing: 23) {
                        ForEach(viewModel.matches, id: \.self) { match in
                            NavigationLink(destination: DetailsView(match: match)){
                                MatchCardView(match: match)
                            }
                        }
                    }
                }.scrollIndicators(.never)
                    .refreshable {
                        viewModel.getHomeData()
                    }
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                        viewModel.getHomeData()
                    }
            }.background(Color.backgroundColor)
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
