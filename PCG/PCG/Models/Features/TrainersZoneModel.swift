import Foundation

/// トレーナー場のモデル
struct TrainersZoneModel {
    
    private(set) var card: TrainersUICard? = nil
    
    /// 初期化処理
    mutating func initialize() {
        self.card = nil
    }
    
    /// カードを出すことができるか
    func canPlayCard() -> Bool {
        return card == nil
    }
    
    /// カードを出した際の処理
    mutating func play(_ card: TrainersUICard) {
        self.card = card
    }
    
    /// カードを使い終えた際の処理
    mutating func end() {
        self.card = nil
    }
}
