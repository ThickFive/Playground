/*	FILEPATH = "./Base/associated_type.swift"
 *	Associated Type
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
}