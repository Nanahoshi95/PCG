import SwiftUI

/// 相手のベンチ
struct OpponentBench: View {
    
    var myHands: [PokemonUICard]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(50), spacing: 10), count: 5)) {
                ForEach(myHands) { card in
                    ZStack {
                        CardImage(cardNo: card.number, size: .Small)
                        
                        if let damage = card.damage {
                            ZStack {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 30, height: 30)
                                
                                Text("\(damage)")
                            }
                            .offset(x: 0, y: 0)
                        }
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(5)), count: 5)) {
                            ForEach (card.energies) { energy in
                                Image("GlassEnergy")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .offset(x: 0, y: 35)
                            }
                            
                        }
                        .frame(width: 60, height: 80)
                    }
                }
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}
