import Foundation

/// UI用ポケモンカード
struct EnergyUICard : Identifiable, Codable {
    
        /// ID
        let id: UUID
    
        /// タイプ
        let type: Energy
}
