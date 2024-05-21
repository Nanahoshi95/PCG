//
//  OnlineGameRepository.swift
//  PCG
//
//  Created by yamaji on 2024/05/20.
//

import Foundation
import Combine

let localPlayerId = UUID().uuidString

final class OnlineGameRepository: ObservableObject {
    private var firebaseRepository = FirebaseRepository()
    @Published var game: Game!
    
    private var cancellables: Set<AnyCancellable> = []
    
    @MainActor
    func joinGame() async {
        if let gamesToJoin: Game = await getGame() {
            
            self.game = gamesToJoin
            self.game.player2Id = localPlayerId
            self.game.activePlayerId = self.game.player1Id
            
            await updateGame(self.game)
            await listenForChanges(in: self.game.id)
        } else {
            await createNewGame()
            await listenForChanges(in: self.game.id)
        }
    }
    
    @MainActor
    private func createNewGame() async {
        self.game = Game(
            id: UUID().uuidString,
            player1Id: localPlayerId,
            player2Id: "",
            activePlayerId: localPlayerId,
            player1Hand: HandModel(),
            player2Hand: HandModel(),
            player1Bench: BenchModel(),
            player2Bench: BenchModel(),
            player1BattleZone: BattleZoneModel(),
            player2BattleZone: BattleZoneModel(),
            player1TrainersZone: TrainersZoneModel(),
            player2TrainersZone: TrainersZoneModel(),
            player1Deck: DeckModel(),
            player2Deck: DeckModel())
    }
    
    @MainActor
    private func listenForChanges(in gameId: String) async {
        do {
            try await firebaseRepository.listen(from: .Game, documentId: gameId)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        return
                    case .failure(let error):
                        print("Error ", error.localizedDescription)
                    }
                }, receiveValue: { [weak self] game in
                    self?.game = game
                })
                .store(in: &cancellables)
        } catch {
            print("Error listening", error.localizedDescription)
        }
    }
    
    private func getGame() async -> Game? {
        try? await firebaseRepository.getDocuments(from: .Game, for: localPlayerId)?.first
    }
    
    
    func updateGame(_ game: Game) async {
        do {
            try firebaseRepository.saveDocument(data: game, to: .Game)
        } catch {
            print("Error updating online game", error.localizedDescription)
        }
    }
    
    func quitGame() {
        guard game != nil else { return }
        firebaseRepository.deleteDocument(with: self.game.id, from: .Game)
    }
}
