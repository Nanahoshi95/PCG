import Foundation

/// トレーナーの効果データ一覧
struct TrainersEffectiveData {
    
    // 取得
    static func get() -> [TrainersEffective] {
        return [
            TrainersEffective(number: "037489", name: "エネルギー回収")
        ]
    }
}
