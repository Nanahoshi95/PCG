import Foundation

/// 技をデータベースから取得し、提供する構造体
struct MoveProvider {
    
    /// 技一覧を表します。
    static let moves = MoveData.get()
    
    /// ポケモンの技を取得します。
    static func GetMove(_ number: String, _ index: Int) -> Move {
        return moves.first(where: { $0.number == number && $0.index == index })!
    }
}
