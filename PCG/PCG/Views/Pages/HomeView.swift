import SwiftUI

/// HOME画面
struct HomeView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button {
                isPresented.toggle()
            } label: {
                Text("Online")
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            BattleView(cardVM: CardViewModel())
        }
    }
}

#Preview {
    HomeView()
}
