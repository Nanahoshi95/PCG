import Foundation

class CardViewModel: ObservableObject {
    
    
    let onlineRepository = OnlineGameRepository()
    
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
        

        while true {
            myDeck.create(.Glass)
            myDeck.shuffle()
            
            if let drawCards = myDeck.draw(7) {
                if PokemonCardProvider.existsSeedPokemon(drawCards) {
                    myHand.append(drawCards)
                    break
                }
            }
        }
        
        while true {
            opponentDeck.create(.Glass)
            opponentDeck.shuffle()
            
            if let drawCards = opponentDeck.draw(7) {
                if PokemonCardProvider.existsSeedPokemon(drawCards) {
                    opponentHand.append(drawCards)
                    break
                }
            }
        }
        
        for card in myHand.cards {
            guard PokemonCardProvider.checkSeedPokemon(card) else {
                continue
            }
            
            
            if !myBattleZone.exists() {
                myHand.play(card)
                myBattleZone.play(card)
                
                continue
            }
            
            if myBench.canAppend() {
                myHand.play(card)
                myBench.append(card)
                
                continue
            }
        }
        
        for card in opponentHand.cards {
            guard PokemonCardProvider.checkSeedPokemon(card) else {
                continue
            }
            
            
            if !opponentBattleZone.exists() {
                opponentHand.play(card)
                opponentBattleZone.play(card)
                
                continue
            }
            
            if opponentBench.canAppend() {
                opponentHand.play(card)
                opponentBench.append(card)
                
                continue
            }
        }
        
        
        deploySide()
    }
    
    /// サイドを配置します。
    func deploySide() {
        if let drawCards = myDeck.draw(6) {
            mySide.deploy(drawCards)
        }
        
        if let drawCards = opponentDeck.draw(6) {
            opponentSide.deploy(drawCards)
        }
    }
    
    func quitGame() {
        onlineRepository.quitGame()
    }
    
}
