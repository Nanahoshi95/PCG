import Foundation

/// ベンチのModel
struct BenchModel {
    
    /// カード一覧
    private var cards = [PokemonUICard]()
    
    /// ターン変更時の処理
    mutating func changeTurn() {
        
        for (index, _) in cards.enumerated() {
            // 進化可能にする
            cards[index].canEvolution = true
        }
    }
    
    /// まだベンチにポケモンを置けるか
    func canAppend() -> Bool {
        var maxCount = 5
        return cards.count < maxCount
    }
    
    /// エネルギーをつける必要があるか（AI用）
    func needEnergyCard(_ index: Int) -> Bool {
        
        guard existsCard(index: index) else {
            return false
        }
        
        let card = cards[index]
        
        let cantPlayMove1 = card.energies.count < card.move1.energies.count
        
        // 技2がある
        if let move2 = card.move2 {
            let cantPlayMove2 = card.energies.count < move2.energies.count
            return cantPlayMove1 || cantPlayMove2
        }
        else {
            return cantPlayMove1
        }
    }
    
    /// 指定のインデックスにカードがあるかどうか
    func existsCard(index: Int) -> Bool {
        return cards.indices.contains(index)
    }
    
    /// エネルギーをつける
    mutating func appendEnergy(index: Int, energy: EnergyUICard) {
        cards[index].energies.append(energy)
    }
    
    /// 進化可能なカードがあるか
    mutating func existCanEvolutionCard(_ card: PokemonUICard) -> Bool {
        return cards.contains(where: { $0.number == card.childNumber && $0.canEvolution })
    }
    
    /// 進化可能かどうか
    func canEvolution(index: Int, card: PokemonUICard) -> Bool {
        
        guard cards.indices.contains(index) else {
            return false
        }
        
        return card.childNumber == cards[index].number && cards[index].canEvolution
    }
    
    /// 進化
    mutating func evolution(_ card: PokemonUICard) {
        
        let index = cards.firstIndex(where: { $0.number == card.childNumber && $0.canEvolution })!
        
        let energies = cards[index].energies
        
        // 進化
        cards[index] = card
        
        // エネルギー付け替え
        cards[index].energies = energies
        
        // ダメージ反映
        if let damage = cards[index].damage {
            cards[index].damage = damage
            cards[index].hitPoint = cards[index].maxHitPoint - damage
        }
    }
    
    /// 進化
    mutating func evolution(index: Int, card: PokemonUICard) {
        
        let energies = cards[index].energies
        
        // 進化
        cards[index] = card
        
        // エネルギー付け替え
        cards[index].energies = energies
        
        // ダメージ反映
        if let damage = cards[index].damage {
            cards[index].damage = damage
            cards[index].hitPoint = cards[index].maxHitPoint - damage
        }
    }
    
    /// カードを加える
    mutating func append(_ card: Card) {
        cards.append(PokemonCardConverter.convertToUI(card))
    }
    
    /// カードを加える
    mutating func append(_ card: PokemonUICard) {
        cards.append(card)
    }
    
    /// カードを削除
    mutating func remove(_ card: PokemonUICard) {
        cards.removeAll(where: { $0.id == card.id })
    }
    
    /// ベンチカードを取得
    mutating func getBenchCard(_ index: Int) -> PokemonUICard {
        return cards.remove(at: index)
    }
}
