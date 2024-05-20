//
//  FCCollectionReference.swift
//  PCG
//
//  Created by yamaji on 2024/05/20.
//

import Foundation
import Firebase

enum FCCollectionReference: String {
    case Game
}

func FirebaseReference(_ reference: FCCollectionReference) -> CollectionReference {
    Firestore.firestore().collection(reference.rawValue)
}
