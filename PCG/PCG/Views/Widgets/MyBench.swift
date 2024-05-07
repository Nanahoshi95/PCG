import SwiftUI

/// 自分のベンチ場
struct MyBench: View {
    
    var myHands: [PokemonUICard]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(50), spacing: 10), count: 5)) {
                ForEach(myHands) { card in
                    CardImage(cardNo: card.number, size: .Small)
                }
            }
        }
    }
}
