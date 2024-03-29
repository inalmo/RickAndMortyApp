//
//  SearchViewModel+Test.swift
//  RickMortyAppTests
//
//  Created by Iñigo Alonso Molledo on 29/2/24.
//

import XCTest
@testable import RickMortyApp

// MARK: - Test
class SearchViewModelTest: XCTestCase {
    
    // GIVEN
    var sut: SearchViewModel?
    var sutFailure: SearchViewModel?
    
    override func setUp() {
        super.setUp()
        sut = SearchViewModel(useCase: DefaultCharacterUseCase(repository: DefaultCharacterRepository(apiService: CharacterListFakeApiServiceSuccess())))
        sutFailure = SearchViewModel(useCase: DefaultCharacterUseCase(repository: DefaultCharacterRepository(apiService: CharacterListFakeApiServiceFailure())))
    }
    
    override func tearDown() {
        sut = nil
        sutFailure = nil
        super.tearDown()
    }
}

// MARK: - Success Tests
extension SearchViewModelTest {
    func testSuccessCaseSearchCharacter() async {
        await sut?.searchCharacter(by: "Rick", isFirstLoad: true)
        XCTAssertTrue(sut?.characterList.first?.id == 21)
    }
}

// MARK: - Failure Tests
extension SearchViewModelTest {
    func testFailureCase_loadCharacterList() async {
        guard let sutFailure else { return }
        await sutFailure.searchCharacter(by: "Rick", isFirstLoad: true)
        XCTAssertTrue(sutFailure.characterList.isEmpty)
    }
}
