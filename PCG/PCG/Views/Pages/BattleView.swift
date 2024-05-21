import SwiftUI

/// 対戦画面
struct BattleView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var cardVM: CardViewModel
    
    @Namespace private var namespace
    
    @State private var selectedCard: Card? = nil
    
    var body: some View {
        ZStack {
            Color(red: 218/255, green: 234/255, blue: 248/255)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                PlayMat(ballColor: Color(red: 210/255, green: 206/255, blue: 244/255), isMine: false)
                
                PlayMat(ballColor: Color(red: 131/255, green: 165/255, blue: 228/255), isMine: true)
                
                Rectangle()
                    .frame(height: 40)
                    .foregroundStyle(.white)
            }
            
            
            VStack(spacing: 10) {
                
                OpponentHand(cardVM: cardVM)
                    .frame(width: Sizes.screenWidth, height: Sizes.cardHeight)
                
                OpponentBench(cardVM: cardVM)
                    .frame(width: Sizes.screenWidth, height: Sizes.benchCardHeight)
                
                OpponentBattleZone(cardVM: cardVM)
                    .frame(width: Sizes.cardWidth, height: Sizes.cardHeight)
                
                
                MyBattleZone(cardVM: cardVM, selectedCard: $selectedCard)
                    .frame(width: Sizes.cardWidth, height: Sizes.cardHeight)
                
                MyBench(cardVM: cardVM)
                    .frame(width: Sizes.screenWidth, height: Sizes.benchCardHeight)
                
                MyHand(cardVM: cardVM)
                    .frame(width: Sizes.screenWidth, height: Sizes.cardHeight)
                
            }
            
            if let card = selectedCard {
                Image(card.number)
                    .resizable()
                    .frame(width: 300, height: 400)
                    .onTapGesture {
                        withAnimation(.easeOutExpo) {
                            selectedCard = nil
                        }
                    }
                    .matchedGeometryEffect(id: card.id
                                           , in: namespace)
            }
            
            HStack {
                Spacer()
                
                Button {
                    cardVM.quitGame()
                    dismiss()
                } label: {
                    Text("終了")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                }
                .frame(width: 80, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
            }
            .frame(width: Sizes.screenWidth, height: Sizes.screenHeight, alignment: .top)
            .padding(.top)
            .padding(.trailing, 50)
        }
    }
}

#Preview {
    BattleView(cardVM: CardViewModel())
}


extension Animation {
  static let easeOutExpo: Animation = .timingCurve(0.25, 0.8, 0.1, 1, duration: 0.5) 
}
