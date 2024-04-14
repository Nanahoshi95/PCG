import Foundation

/// エネルギーをデータベースから取得し、提供する構造体
struct EnergyCardProvider {
    
    /// エネルギー一覧
    private static let energies = EnergyCardData.get()
}
