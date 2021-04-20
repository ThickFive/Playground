/*	FILEPATH = "./Base/protocal_without_associated_type.swift"
 *	Protocal Without Associated Type
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
    func attack()
}

struct Pikachu: Pokemon {
    func attack() {
        print("Pikachu Attack")
    }
}

struct Charmander: Pokemon {
    func attack() {
        print("Charmander Attack")
    }
}

Test.run {
    let pokemon1: Pokemon = Pikachu()
    pokemon1.attack()
    let pokemon2: Pokemon = Charmander()
    pokemon2.attack()
}