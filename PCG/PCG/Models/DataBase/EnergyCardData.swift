import Foundation

/// エネルギーカードデータ
struct EnergyCardData {
    
    // 取得
    static func get() -> [EnergyCard] {
        return [
            EnergyCard(number: "000001", type: .Glass),
            EnergyCard(number: "000002", type: .Fire),
            EnergyCard(number: "000003", type: .Water),
            EnergyCard(number: "000004", type: .Electric),
            EnergyCard(number: "000006", type: .Fighting),
        ]
    }
}
