import Foundation

/// ポケモンカードの変換機
struct PokemonCardConverter {
    
    // UI用に変換
    static func convertToUI(_ card: Card) -> PokemonUICard {
        let pokemonCard = PokemonCardProvider.getCard(card)
        
        return PokemonUICard(
            id: card.id,
            number: pokemonCard.number,
            childNumber: pokemonCard.childNumber,
            grandChildNumber: pokemonCard.grandChildNumber,
            evolution: pokemonCard.evolution,
            category: pokemonCard.category,
            hitPoint: pokemonCard.hitPoint,
            maxHitPoint: pokemonCard.hitPoint,
            energies: [],
            type: pokemonCard.type,
            weaknessType: pokemonCard.weaknessType,
            resistanceType: pokemonCard.resistanceType,
            move1: pokemonCard.move1,
            move2: pokemonCard.move2,
            retreatEnergy: pokemonCard.retreatEnergy,
            retreatCount: pokemonCard.retreatCount,
            damage: nil,
            canEvolution: false)
    }
}
