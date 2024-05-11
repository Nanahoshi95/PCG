import SwiftUI

struct CardEnergies: View {
    
    var energies: [EnergyUICard]
    
    let width: CGFloat
    
    let height: CGFloat
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(10)), count: 5)) {
            ForEach (energies) { energy in
                Image("GlassEnergy")
                    .resizable()
                    .frame(width: width, height: height)
            }
        }
    }
}

struct BenchCardEnergies: View {
    
    var energies: [EnergyUICard]
    
    var body: some View {
        CardEnergies(energies: energies, width: 12, height: 12)
            .frame(width: 60, height: 80)
    }
}

struct BattleZoneEnergies: View {
    var energies: [EnergyUICard]
    
    var body: some View {
        CardEnergies(energies: energies, width: 17, height: 17)
            .frame(width: 90, height: 120)
    }
}
