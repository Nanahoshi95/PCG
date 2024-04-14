import Foundation

/// デッキの構造体
struct DeckModel {
    
    /// カード一覧
    var cards = [Card]()
    
    /// デッキ作成
    mutating func create(_ type: DeckType) -> [Card] {
        
        let creator = DeckCreatorFactory().create(type)
        cards = creator.create()
        
        return cards
    }
    
    /// デッキにカード追加
    mutating func append(_ card: Card) {
        cards.append(card)
    }
    
    /// デッキに複数カード追加
    mutating func append(_ cards: [Card]) {
        self.cards.append(contentsOf: cards)
    }
    
    /// デッキからカード削除
    mutating func remove(_ card: Card) {
        cards.removeAll(where: { $0.number == card.number})
    }

    /// 指定枚数ドロー
    /// ※ドローできない場合は、nil
    mutating func draw(_ count: Int) -> [Card]? {
        
        if cards.count >= count {

            let drawCards = cards.prefix(upTo: count).map({$0})
            
            // デッキからドロー分を削除
            cards.removeSubrange(0..<count)
            
            return drawCards
        }
        
        return nil
    }
    
    /// カードをシャッフル
    mutating func shuffle() {
        cards.shuffle()
    }
  
    /// エネルギーカード一覧取得
    func getEnergyCards() -> [Card] {
        return cards.filter({$0.category == .Energy})
    }
    
    /// ポケモンカード一覧取得
    func getPokemonCards() -> [Card] {
        return cards.filter({$0.category == .Pokemon})
    }
    
    /// 種ポケモンカード取得
    mutating func getSeedPokemonCards() -> [Card] {
        let pokemonCards = getPokemonCards()
        let seedPokemonCards = PokemonCardManager.getSeedPokemonCards()
        return pokemonCards.filter({ element in
            seedPokemonCards.contains(where: { $0.number == element.number })
        })
    }
}
