/*	FILEPATH = "./Base/type_erase.swift"
 *	Type Erase: https://www.swiftbysundell.com/articles/different-flavors-of-type-erasure-in-swift/
    https://krakendev.io/blog/generic-protocols-and-their-shortcomings
 */

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        let start = Date()
        print("\(start): Test start")
        code()
        let end = Date()
        print("\(end): Test end in \(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
    }
}

protocol Pokemon {
    associatedtype Power
    func attack() -> Power
}

struct 🌩 {
    
}

struct 🔥 {

}

struct AnyPokemon<Power> {
    private let _attack: () -> Power

    init<P: Pokemon>(_ pokemon: P) where Power == P.Power {
        self._attack = pokemon.attack
    }

    func attack() -> Power {
        return _attack()
    }
}

struct Pikachu: Pokemon {
    func attack() -> 🌩 {
        print("Pikachu Attack")
        return 🌩()
    }
}

struct Charmander: Pokemon {
    func attack() -> 🔥 {
        print("Charmander Attack")
        return 🔥()
    }
}

Test.run {
    let pokemon1: AnyPokemon = AnyPokemon<🌩>(Pikachu())
    _ = pokemon1.attack()
    let pokemon2: AnyPokemon = AnyPokemon<🔥>(Charmander())
    _ = pokemon2.attack()
}