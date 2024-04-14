import Foundation


/// トレーナーカード
struct TrainersCard {
    
    /// カードの番号
    var number: String
    
    /// 効果
    var effective: TrainersEffective
    
    /// 持ち物かどうか
    var isHeldItem: Bool
    
    init(number: String, isHeldItem: Bool = false) {
        self.number = number
        self.effective = TrainersEffectiveProvider.get(number)
        self.isHeldItem = isHeldItem
    }
}
