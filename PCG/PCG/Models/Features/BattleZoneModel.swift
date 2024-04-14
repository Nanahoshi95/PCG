import Foundation

/// バトル場Model
struct BattleZoneModel {
    
    /// 出ているカード
    private (set) var card: PokemonUICard? = nil
    
    /// エネルギーをつける必要があるか（AI用）
    func needAppendingEnergy() -> Bool {
        
        guard let pokemonCard = self.card else {
            return false
        }
        
        let cantPlayMove1 = pokemonCard.energies.count < pokemonCard.move1.energies.count
        
        // 技2がある
        if let move2 = pokemonCard.move2 {
            let cantPlayMove2 = pokemonCard.energies.count < move2.energies.count
            return cantPlayMove1 || cantPlayMove2
        }
        else {
            return cantPlayMove1
        }
    }
    
    /// カード存在有無
    func exists() -> Bool {
        return card != nil
    }
    
    /// 技1を出せるか
    func canPlayMove1() -> Bool {
        
        guard let card = self.card else {
            return false
        }
        
        return card.energies.count >= card.move1.energies.count
    }
    
    /// 技2を出せるか
    func canPlayMove2() -> Bool {
        
        guard let card = self.card, let move2 = card.move2 else {
            return false
        }
        
        return card.energies.count >= move2.energies.count
        
    }
    
    /// 進化可能か（AI用）
    func canEvolution(_ card: PokemonUICard) -> Bool {
        
        guard let battleCard = self.card else {
            return false
        }
        
        return (card.childNumber == battleCard.number) && battleCard.canEvolution
    }
    
    /// ターン交換時の処理
    mutating func changeTurn() {
        
        if card == nil {
            return
        }
        
        card!.canEvolution = true
    }
    
    /// カードを出す
    mutating func play(_ card: Card) {
        self.card = PokemonCardConverter.convertToUI(card)
    }
    
    /// 攻撃を受けた時の処理
    ///  - returns: 倒れた際の取得サイド数（倒れていない：0、普通：1、V ：2 ）
    mutating func attacked(_ damage: Int) throws -> Int {
        
        if card == nil {
            throw NSError(domain: "error", code:-1, userInfo: nil)
        }
        
        let beforeDamage = card!.damage ?? 0
        card!.damage = beforeDamage + damage
        
        card!.hitPoint = card!.hitPoint - damage > 0 ? card!.hitPoint - damage : 0
        
        // ヒットポイントが0以外
        guard card!.hitPoint == 0 else {
            return 0
        }
    
        let sideCount = card!.category == .V ? 2 : 1
        
        // 瀕死
        card = nil
        
        return sideCount
    }
    
    /// エネルギーをつける
    mutating func appendEnergy(_ energy: EnergyUICard) throws {
        if card == nil {
            throw NSError(domain: "error", code:-1, userInfo: nil)
        }
        
        card!.energies.append(energy)
    }
    
    /// カードを指定のものにする
    mutating func changeCard(_ pokemonCard: PokemonUICard) {
        self.card = pokemonCard
    }
}
