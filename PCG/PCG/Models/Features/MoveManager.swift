import Foundation

struct MoveManager {
    /// ポケモンの技を取得します。
    static func GetMove(_ number: String, _ index: Int) -> Move {
        return MoveData.get().first(where: { $0.number == number && $0.index == index })!
    }
}
