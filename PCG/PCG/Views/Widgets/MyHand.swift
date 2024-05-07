import SwiftUI

/// 自分の手札
struct MyHand: View {
    
    var myHands: [PokemonUICard]
    
    var body: some View {
        HStack {
            ForEach(myHands) { card in
                CardImage(cardNo: card.number, size: .Normal)
                
            }
        }
    }
}
