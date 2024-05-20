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
    
    func quitGame() {
        guard game != nil else { return }
        firebaseRepository.deleteDocument(with: self.game.id, from: .Game)
    }
}
