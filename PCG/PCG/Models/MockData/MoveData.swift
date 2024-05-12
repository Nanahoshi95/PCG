import Foundation

/// 技データ一覧
struct MoveData {
    
    // 取得
    static func get() -> [Move] {
        return [
            Move(number: "037479", index: 1, name: "ともだちをさがす", energies: [.Glass], damage: nil),
            Move(number: "037479", index: 2, name: "ラインフォース", energies: [.Glass, .Normal], damage: 50),
            Move(number: "037480", index: 1, name: "あまいかおり", energies: [.Normal], damage: nil),
            Move(number: "037480", index: 2, name: "チクチクさす", energies: [.Glass, .Normal], damage: 20),
            Move(number: "037481", index: 1, name: "くっつく", energies: [.Normal], damage: 10),
            Move(number: "037482", index: 1, name: "わたながし", energies: [.Normal], damage: nil),
            Move(number: "037482", index: 2, name: "リーフステップ", energies: [.Glass], damage: 50),
            Move(number: "037483", index: 1, name: "いっしょにかむ", energies: [.Glass, .Normal], damage: 30),
            Move(number: "037484", index: 1, name: "ひっかく", energies: [.Normal], damage: 10),
            Move(number: "037484", index: 2, name: "たたく", energies: [.Glass, .Normal], damage: 20),
            Move(number: "037485", index: 1, name: "たたく", energies: [.Glass, .Normal], damage: 30),
            Move(number: "037485", index: 2, name: "おそいかかる", energies: [.Glass, .Glass, .Normal], damage: 50),
            Move(number: "037486", index: 1, name: "うちならす", energies: [.Glass, .Glass, .Normal], damage: 90),
            Move(number: "037486", index: 2, name: "ドラゴンアタック", energies: [.Glass, .Glass, .Glass, .Normal], damage: 180),
            Move(number: "037487", index: 1, name: "なかまをよぶ", energies: [.Normal], damage: nil),
            Move(number: "037488", index: 1, name: "ころがりたっくる", energies: [.Normal, .Normal, .Normal], damage: 80),
            Move(number: "037488", index: 2, name: "ヘビーインパクト", energies: [.Normal, .Normal, .Normal, .Normal], damage: 130),
        ]
    }
}
