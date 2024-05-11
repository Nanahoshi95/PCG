import Foundation

class CardViewModel: ObservableObject {
    
    /// 自分のデッキ
    @Published var myDeck = DeckModel()
    
    /// 相手のデッキ
    @Published var opponentDeck = DeckModel()
    
    /// 自分の手札
    @Published var myHand = HandModel()
    
    /// 相手の手札
    @Published var opponentHand = HandModel()
    
    /// 自分のバトル場
    @Published var myBattleZone = BattleZoneModel()
    
    /// 相手のバトル場
    @Published var opponentBattleZone = BattleZoneModel()
    
    /// 自分のトレーナーズ場
    @Published var myTrainersZone = TrainersZoneModel()
    
    /// 相手のトレーナーズ場
    @Published var opponentTrainersZone = TrainersZoneModel()
    
    /// 自分のベンチ
    @Published var myBench = BenchModel()
    
    /// 相手のベンチ
    @Published var opponentBench = BenchModel()
    
    /// 自分のサイド
    @Published var mySide = SideModel()
    
    /// 相手のサイド
    @Published var opponentSide = SideModel()
    
    init() {
        start()
    }
    
    /// 初期化処理
    func intialize() {

    }
    
    func start() {
        myDeck.create(.Glass)
        opponentDeck.create(.Glass)
        
        myDeck.shuffle()
        
        myHand.append(myDeck.draw(7)!)
        
        deploySide()
    }
    
    /// サイドを配置します。
    func deploySide() {
        if let drawCards = myDeck.draw(6) {
            mySide.deploy(drawCards)
        } else {
            
        }
    }
    
}
