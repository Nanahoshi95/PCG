import Foundation

/// デッキ作成プロトコル
protocol IDeckCreator {
    
    /// デッキを作成します。
    func create() -> [Card]
}
