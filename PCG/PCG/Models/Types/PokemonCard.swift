import Foundation

/// ポケモンカード
struct PokemonCard {
    
    /// カード番号
    var number: String
    
    /// 進化前のカード番号
    var childNumber: String?
    
    /// ニ進化前のカード番号
    var grandChildNumber: String?
    
    /// 進化情報
    var evolution: Evolution
    
    /// 分類（Vなど）
    var category: PokemonCardCategory
    
    /// HP
    var hitPoint: Int
    
    /// タイプ
    let type: Energy
    
    /// 弱点のタイプ
    var weaknessType: Energy?
    
    /// 抵抗があるタイプ
    var resistanceType: Energy?
    
    /// 技1
    var move1: Move
    
    /// 技2
    var move2: Move?
    
    /// 逃げるためのエネルギー
    var retreatEnergy: Energy?
    
    /// 逃げるためのエネルギー数
    var retreatCount: Int
}
