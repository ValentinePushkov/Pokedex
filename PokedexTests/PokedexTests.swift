//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Valson on 18.03.23.
//

import XCTest
import Combine
@testable import Pokedex

class PokedexTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_pokemons_success(){
        let result = Result<[Pokemon], APIError>.success([Pokemon.example()])
        
        let fetcher = PokemonFetcher(service: APIMockService(result))
        
        let promise = expectation(description: "getting pokemons")
        
        fetcher.$pokemons.sink { pokemons in
            if pokemons.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        
        wait(for: [promise], timeout: 2)
    }
    
    func test_loading_error() {
        
        let result = Result<[Pokemon], APIError>.failure(APIError.badURL)
        let fetcher = PokemonFetcher(service: APIMockService(result))
        
        let promise = expectation(description: "show error message")
        fetcher.$pokemons.sink { pokemons in
            if !pokemons.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
}
