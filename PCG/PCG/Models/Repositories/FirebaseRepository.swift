//
//  FirebaseRepository.swift
//  PCG
//
//  Created by yamaji on 2024/05/20.
//

import Foundation
import FirebaseFirestore
import Combine

public typealias EncodableIdentifiable = Encodable & Identifiable

final class FirebaseRepository {
    
    func getDocuments<T: Codable>(from collection: FCCollectionReference, for playerId: String) async throws -> [T]? {
        let snapshot = try await FirebaseReference(collection)
            .whereField(AppStrings.player2Id, isEqualTo: "")
            .whereField(AppStrings.player1Id, isNotEqualTo: playerId).getDocuments()
        
        return snapshot.documents.compactMap { QueryDocumentSnapshot -> T? in
            return try? QueryDocumentSnapshot.data(as: T.self)
        }
    }
    
    func listen<T: Codable>(from collection: FCCollectionReference, documentId: String) async throws -> AnyPublisher<T?, any Error> {
        
        let subject = PassthroughSubject<T?, Error>()
        
        let handle = FirebaseReference(collection).document(documentId).addSnapshotListener { querySnapshot, error in
            
            if let error = error {
                subject.send(completion: .failure(error))
            }
            
            guard let document = querySnapshot else {
                subject.send(completion: .failure(AppError.badSnapshot))
                return
            }
            
            let data = try? document.data(as: T.self)
            
            subject.send(data)
        }
        
        return subject.handleEvents(receiveCancel: {
            handle.remove()
        }).eraseToAnyPublisher()
    }
    
    func deleteDocument(with id: String, from collection: FCCollectionReference) {
        FirebaseReference(collection).document(id).delete()
    }
    
    func saveDocument<T: EncodableIdentifiable>(data: T, to collection: FCCollectionReference) throws {
        let id = data.id as? String ?? UUID().uuidString
        
        try FirebaseReference(collection).document(id).setData(from: data.self)
    }
}
