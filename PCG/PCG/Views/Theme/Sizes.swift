import SwiftUI

struct Sizes {
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    static var cardWidth: CGFloat {
        screenWidth / 4
    }
    
    static var cardHeight: CGFloat {
        cardWidth * 7 / 5
    }
    
    static var benchCardWidth: CGFloat {
        screenWidth / 6
    }
    
    static var benchCardHeight: CGFloat {
        benchCardWidth * 7 / 5
    }
}
