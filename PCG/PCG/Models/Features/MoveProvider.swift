import Foundation

/// 技をデータベースから取得し、提供する構造体
struct MoveProvider {
    
    /// 技一覧
    private static let moves = MoveData.get()
    
    /// 取得
    static func get(_ number: String, _ index: Int) -> Move? {
        return moves.first(where: { $0.number == number && $0.index == index })
    }
}
