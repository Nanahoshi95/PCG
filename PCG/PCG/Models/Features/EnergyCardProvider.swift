import Foundation

/// エネルギーをデータベースから取得し、提供する構造体
struct EnergyCardProvider {
    
    static let energies = EnergyCardData.get()
}
