import Foundation
import Combine

class CardViewModel: ObservableObject {
    
    
    let onlineRepository = OnlineGameRepository()

    @Published private(set) var myDeck = DeckModel()
    @Published private(set) var opponentDeck = DeckModel()
    @Published private(set) var myHand = HandModel()
    @Published private(set) var opponentHand = HandModel()
    @Published private(set) var myBattleZone = BattleZoneModel()
    @Published private(set) var opponentBattleZone = BattleZoneModel()
    @Published private(set) var myTrainersZone = TrainersZoneModel()
    @Published private(set) var opponentTrainersZone = TrainersZoneModel()
    @Published private(set) var myBench = BenchModel()
    @Published private(set) var opponentBench = BenchModel()
    @Published private(set) var mySide = SideModel()
    @Published private(set) var opponentSide = SideModel()
    
    @Published private(set) var isShowLoading = false
    @Published private(set) var onlineGame: Game?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        start()
        observeData()
    }
    
    private func observeData() {
        onlineRepository.$game
            .map { $0 }
            .assign(to: &$onlineGame)
        
        $onlineGame
            .drop(while: { $0 == nil })
            .map { $0?.player2Id == "" }
            .assign(to: &$isShowLoading)
        
        $onlineGame
            .drop(while: { $0 == nil })
            .sink { updateGame in
                self.syncOnlineWithLocal(onlineGame: updateGame)
            }
            .store(in: &cancellables)
    }
    
    private func syncOnlineWithLocal(onlineGame: Game?) {
        
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
