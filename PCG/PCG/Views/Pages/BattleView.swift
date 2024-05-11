import SwiftUI

/// 対戦画面
struct BattleView: View {
    
    @StateObject private var cardVM = CardViewModel()
    
    @State private var myHands: [PokemonUICard] = [
        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false),
        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),]
    
    @Namespace private var namespace
    
    @State private var selectedCard: Card? = nil
    
    var body: some View {
        ZStack {
            Color(red: 218/255, green: 234/255, blue: 248/255)
              .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                PlayMat(ballColor: Color(red: 210/255, green: 206/255, blue: 244/255), isMine: false)
                
                PlayMat(ballColor: Color(red: 131/255, green: 165/255, blue: 228/255), isMine: true)
                
                Rectangle()
                    .frame(height: 40)
                    .foregroundStyle(.white)
            }
            
            
            
            
            VStack {
                
                OpponentHand(myHands: myHands)
                
                OpponentBench(myHands: $myHands)
                
                OpponentBattleZone(battleCard:
                                    PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false))
                
                Spacer()
                
                MyBattleZone(selectedCard: $selectedCard)
                
                MyBench(myHands: $myHands)
                
                MyHand(hand: $cardVM.myHand)
                
            }
            
            if let card = selectedCard {
                Image(card.number)
                    .resizable()
                    .frame(width: 300, height: 400)
                    .onTapGesture {
                        withAnimation(.easeOutExpo) {
                            selectedCard = nil
                          }
                    }
                    .matchedGeometryEffect(id: card.id
                                           , in: namespace)
            }
        }
    }
}

#Preview {
    BattleView()
}


extension Animation {
  static let easeOutExpo: Animation = .timingCurve(0.25, 0.8, 0.1, 1, duration: 0.5) 
}
