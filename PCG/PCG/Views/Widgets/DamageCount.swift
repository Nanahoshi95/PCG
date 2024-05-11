import SwiftUI

struct DamageCount: View {
    
    var damage: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
            
            Text("\(damage)")
        }
    }
}

#Preview {
    DamageCount(damage: 100)
}
