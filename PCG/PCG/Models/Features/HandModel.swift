import Foundation

/// 手札Model
struct HandModel {
    
    /// カード情報一覧
    private (set) var cards = [Card]()
    
    /// カード追加
    mutating func append(_ card: Card) {
        cards.append(card)
    }
    
    /// 複数カードを追加
    mutating func append(_ cards: [Card]) {
        self.cards.append(contentsOf: cards)
    }
    
    /// カードを出す
    mutating func play(_ card: Card) {
        cards.removeAll(where: { $0.id == card.id })
    }
    
    /// カードをトラッシュ
    mutating func remove(_ card: Card) {
        cards.removeAll(where: { $0.id == card.id })
    }
    
    /// カードを全てトラッシュ
    mutating func removeAll() {
        cards.removeAll()
    }
}
