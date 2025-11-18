//
//  DatabaseServiceProtocol.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 18.11.2025.
//

import Combine
import FirebaseFirestore
import Foundation

protocol DatabaseServiceProtocol {
    func add<T: Encodable>(path: DatabasePath, documentId: String, data: T) -> AnyPublisher<Bool, Error>
    func fetch<T: Decodable>(path: DatabasePath, documentId: String, type: T.Type, source: FirestoreSource) -> AnyPublisher<T, Error>
    func checkDocumentExists(path: DatabasePath, documentId: String, source: FirestoreSource) -> AnyPublisher<Bool, Error>
}
