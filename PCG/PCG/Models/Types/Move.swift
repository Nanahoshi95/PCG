import Foundation

/// ポケモンの技
struct Move {
    
    /// ポケモンカードの番号
    var number: String
    
    /// 技順
    var index: Int
    
    /// 技名
    var name: String
    
    /// 必要エネルギー
    var energies: [Energy]
    
    /// ダメージ量
    var damage: Int?
}
