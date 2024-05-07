import SwiftUI

/// 相手の手札
struct OpponentHand: View {
    
    var myHands: [PokemonUICard]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(10)), count: myHands.count)) {
                ForEach(myHands) {
                    card in
                    CardImage(cardNo: "Back", size: .Normal)
                }
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}
