import Foundation

/// ポケモンカードをデータベースから取得し、提供する構造体
struct PokemonCardProvider {
    
    static let pokemonCards = PokemonCardData.get()
    
    /// 指定カード一覧の中に種ポケモンが存在するかどうかを返します。
    static func existsSeedPokemon(_ cards: [Card]) -> Bool {
        
        /// 種ポケモンを取得
        let seedPokemonCards = getSeedPokemonCards()
           
        var result = false
        
        cards.forEach({ card in
            if seedPokemonCards.contains(where: { $0.number == card.number }) {
                result = true
                return
            }
        })
        
        return result
    }
    
    /// 種ポケモン一覧を取得します。
    static func getSeedPokemonCards() -> [PokemonCard] {
        return pokemonCards.filter({ $0.evolution == .Basic })
    }
    
    /// 指定カードが種ポケモンかどうかを確認します。
    static func checkSeedPokemon(_ card: Card) -> Bool {
        
        let seedPokemonCards = getSeedPokemonCards()
        
        return seedPokemonCards.contains(where: { $0.number == card.number })
    }
    
    /// ポケモンのカードかどうかを確認します。
    static func chackPokemonCard(_ card: Card) -> Bool {
        return pokemonCards.contains(where: { $0.number == card.number })
    }
}
