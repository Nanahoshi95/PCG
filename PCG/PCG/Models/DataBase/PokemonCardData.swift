import Foundation

/// ポケモンカード一覧
struct PokemonCardData {
    
    // 取得
    static func get() -> [PokemonCard] {
        return [
            PokemonCard(number: "037479", evolution: .Basic, category: .V, hitPoint: 180, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037479", 1), move2: MoveProvider.GetMove("037479", 2), retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037480", evolution: .Basic, category: .Normal, hitPoint: 70, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037480", 1), move2: MoveProvider.GetMove("037480", 2), retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037481", evolution: .Basic, category: .Normal, hitPoint: 60, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037481", 1), move2: nil, retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037482", childNumber: "037481", evolution: .Stage1, category: .Normal, hitPoint: 100, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037482", 1), move2: MoveProvider.GetMove("037482", 2), retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037483", evolution: .Basic, category: .Normal, hitPoint: 110, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037483", 1), move2: nil, retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037484", evolution: .Basic, category: .Normal, hitPoint: 70, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037484", 1), move2: MoveProvider.GetMove("037484", 2), retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037485", childNumber: "037484", evolution: .Stage1, category: .Normal, hitPoint: 100, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037485", 1), move2: MoveProvider.GetMove("037485", 2), retreatEnergy: .Normal, retreatCount: 2),
            
            PokemonCard(number: "037486", childNumber: "037485", grandChildNumber: "037484", evolution: .Stage2, category: .Normal, hitPoint: 190, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037486", 1), move2: MoveProvider.GetMove("037486", 2), retreatEnergy: .Normal, retreatCount: 4),
            
            PokemonCard(number: "037487", evolution: .Basic, category: .Normal, hitPoint: 40, type: .Glass, weaknessType: .Fire, resistanceType: nil, move1: MoveProvider.GetMove("037487", 1), move2: nil, retreatEnergy: .Normal, retreatCount: 1),
            
            PokemonCard(number: "037488", evolution: .Basic, category: .Normal, hitPoint: 150, type: .Normal, weaknessType: .Fighting, resistanceType: nil, move1: MoveProvider.GetMove("037488", 1), move2: MoveProvider.GetMove("037488", 2), retreatEnergy: .Normal, retreatCount: 4)
        ]
    }
}
