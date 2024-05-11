import Foundation

struct SideModel {
    private (set) var cards: [Card] = [Card(number: "", category: .Energy), Card(number: "", category: .Energy), Card(number: "", category: .Energy)]
    
    /// 初期化処理
    mutating func initialize() {
        self.cards.removeAll()
    }
    
    /// サイドにカードを配置
    mutating func deploy(_ cards: [Card]) {
        self.cards.append(contentsOf: cards)
    }
    
    /// サイドを取得
    mutating func getSides(count: Int) -> [Card] {
        
        let result = cards.prefix(count).map( { $0 })
        
        if result.count > 0 {
            cards.removeSubrange(0..<count)
        }
        
        return result
    }
}
