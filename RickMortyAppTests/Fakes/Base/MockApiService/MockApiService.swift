//
//  MockApiService.swift
//  RickMortyAppTests
//
//  Created by Iñigo Alonso Molledo on 29/2/24.
//

import Foundation
@testable import RickMortyApp

class CharacterListFakeApiServiceSuccess: ApiService {
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response  {
        do {
            let json = CharacterListFake.makeCharacterListJsonFake()
            let decodedData = try JSONDecoder().decode(Response.self, from: json)
            return decodedData
        } catch {
            // If decoding fails, throw a parse error
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            // Else throw the original service error
            throw AppError.serviceError(error: error)
        }
    }
}

class CharacterListFakeApiServiceFailure: ApiService {
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response  {
        throw AppError.missingData
    }
}

class CharacterListFakeApiServiceParseErrorFailure: ApiService {
    func getDataFromGetRequest<Response : Codable>(from url: String) async throws -> Response  {
        do {
            let json = CharacterListFake.makeCharacterListJsonFakeParseError()
            let decodedData = try JSONDecoder().decode(Response.self, from: json)
            return decodedData
        } catch {
            // If decoding fails, throw a parse error
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            // Else throw the original service error
            throw AppError.serviceError(error: error)
        }
    }
}
