import SwiftUI

struct Sizes {
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width / 4
    }
    
    static var cardHeight: CGFloat {
        cardWidth * 7 / 5
    }
    
    static var benchCardWidth: CGFloat {
        UIScreen.main.bounds.width / 6
    }
    
    static var benchCardHeight: CGFloat {
        benchCardWidth * 7 / 5
    }
}
