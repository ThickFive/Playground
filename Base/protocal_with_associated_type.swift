/*	FILEPATH = "./Base/protocal_with_associated_type.swift"
 *	Protocal With Associated Type
    protocol `Protocal With Associated Type` can only be used as a generic constraint because it has Self or associated type requirements
    use type erase instead
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

struct Pikachu: Pokemon {
    func attack() -> 🌩 {
        return 🌩()
    }
}

struct Charmander: Pokemon {
    func attack() -> 🔥 {
        return 🔥()
    }
}

Test.run {
    let picachu = Pikachu()
    print(picachu.attack())
    let charmander = Charmander()
    print(charmander.attack())

    //  error: protocol 'Pokemon' can only be used as a generic constraint because it has Self or associated type requirements
    // let pokemon1: Pokemon = Pikachu()
    // _ = pokemon1.attack()
    // let pokemon2: Pokemon = Charmander()
    // _ = pokemon2.attack()
}