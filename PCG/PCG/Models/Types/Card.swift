import Foundation

/// カード情報
struct Card: Identifiable, Equatable, Hashable {
    
    /// カードを一意に識別するためのID（同一のカードを区別する用）
    var id = UUID()
    
    /// カード番号
    var number: String
    
    /// カードの種別（ポケモン、グッズ、サポート、エネルギー）
    var category : CardCategory
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
