/*	FILEPATH = "./Base/generic.swift"
 *	Generic
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

struct AnyPokemon<Base: Pokemon> {
    typealias Power = Base.Power
    private let base: Base

    init(_ base: Base)  {
        self.base = base
    }

    func attack() -> Power {
        return self.base.attack()
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
    let pokemon1: AnyPokemon = AnyPokemon(Pikachu())
    _ = pokemon1.attack()
    let pokemon2: AnyPokemon = AnyPokemon(Charmander())
    _ = pokemon2.attack()
}