import Foundation

/// UI用トレーナーカード
struct TrainersUICard : Identifiable {
    
    /// ID
    var id: UUID
    
    /// 番号
    var number: String
    
    /// 効果
    var effective: TrainersEffective
    
    /// 持ち物かどうか
    var isHeldItem: Bool
}
