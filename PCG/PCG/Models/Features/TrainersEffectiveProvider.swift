import Foundation

struct TrainersEffectiveProvider {
    
    /// 技一覧
    private static let effectives = TrainersEffectiveData.get()
    
    /// 取得
    static func get(_ number: String) -> TrainersEffective {
        return effectives.first(where: { $0.number == number })!
    }
}
