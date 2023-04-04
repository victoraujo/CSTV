//
//  FontExtension.swift
//  CSTV
//
//  Created by Victor Vieira on 04/04/23.
//

import SwiftUI

extension Font {
    static var leagueFont: Font {
        .custom("Roboto-Regular", size: 8)
    }
    static var teamFont: Font {
        .custom("Roboto-Regular", size: 10)
    }
    static var vsFont: Font {
        .custom("Roboto-Regular", size: 12)
    }
    static var headingDetailsFont: Font {
        .custom("Roboto-Medium", size: 18)
    }
    static var headingFont: Font {
        .custom("Roboto-Medium", size: 32)
    }
    static var timeFont: Font {
        .custom("Roboto-Bold", size: 8)
    }
    static var timeDetailsFont: Font {
        .custom("Roboto-Bold", size: 12)
    }
    static var nicknameFont: Font {
        .custom("Roboto-Bold", size: 14)
    }
}
