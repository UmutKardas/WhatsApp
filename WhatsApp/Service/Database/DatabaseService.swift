//
//  DatabaseService.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

final class DatabaseService: DatabaseServiceProtocol {
    private let database: Firestore = .firestore()

    func add<T>(path: DatabasePath, documentId: String, data: T) -> AnyPublisher<Bool, Error> where T: Encodable {
        return database.collection(path.rawValue).document(documentId)
            .setData(from: data)
            .map { _ in true }
            .mapError { error in error }
            .eraseToAnyPublisher()
    }

    func fetch<T>(path: DatabasePath, documentId: String, type: T.Type, source: FirestoreSource = .default) -> AnyPublisher<T, Error> where T: Decodable {
        return database.collection(path.rawValue).document(documentId).getDocument(source: source).tryMap { snapshot in
            try snapshot.data(as: T.self)
        }
        .mapError { error in error }
        .eraseToAnyPublisher()
    }

    func checkDocumentExists(path: DatabasePath, documentId: String, source: FirestoreSource = .default) -> AnyPublisher<Bool, Error> {
        return database.collection(path.rawValue).document(documentId).getDocument(source: source).map { snapshot in
            snapshot.exists
        }
        .mapError { error in error }
        .eraseToAnyPublisher()
    }
}
