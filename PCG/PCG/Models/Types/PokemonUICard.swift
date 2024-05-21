import Foundation

/// UI用ポケモンカード
struct PokemonUICard : Identifiable, Equatable, Codable {
    
    /// カードを一意に識別するためのID（同一のカードを区別する用）
    var id: UUID
    
    /// カード番号
    var number: String
    
    /// 進化前の番号
    var childNumber: String?
    
    /// 2進化前の番号
    var grandChildNumber: String?
    
    /// 進化情報
    var evolution: Evolution
    
    /// 分類（Vなど）
    var category: PokemonCardCategory
    
    /// HP
    var hitPoint: Int
    
    /// 最大HP
    var maxHitPoint: Int
    
    /// エネルギー
    var energies: [EnergyUICard]
    
    /// タイプ
    var type: Energy
    
    /// 弱点タイプ
    var weaknessType: Energy?
    
    /// 抵抗タイプ
    var resistanceType: Energy?
    
    /// 技1
    var move1: Move
    
    /// 技2
    var move2: Move?
    
    /// 逃げるエネルギー
    var retreatEnergy: Energy?
    
    /// 逃げるエネルギー数
    var retreatCount: Int
    
    /// ダメージ量
    var damage: Int?
    
    /// 進化可能か
    var canEvolution: Bool
    
    static func == (lhs: PokemonUICard, rhs: PokemonUICard) -> Bool {
        return lhs.id == rhs.id
    }
}
