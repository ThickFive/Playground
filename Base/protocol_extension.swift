/*	FILEPATH = "./Base/protocol_extension.swift"
 *	Protocol Extension
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

protocol Runable {
    func run()
}

extension Runable where Self: Animal {  //  给遵守 Runable 协议的 Animal 及其子类添加默认实现
    func run() {
        print("\(type(of: self)) \(self.name) run")
    } 
}

protocol Eatable {
    func eat()
}

extension Eatable where Self: Animal {  //  给遵守 Eatable 协议的 Animal 及其子类添加默认实现
    func eat() {
        print("\(type(of: self)) \(self.name) eat")
    } 
}

protocol Drinkable {
    func drink()
}

extension Drinkable where Self: Monkey {  //  给遵守 Drinkable 协议的 Monkey 及其子类添加默认实现
    func drink() {
        print("\(type(of: self)) \(self.name) drink water")
    } 
}

class Animal: Runable {
    let name: String
    init(_ name: String) {
        self.name = name
    }
}

class Cat: Animal, Eatable {   
}

extension Cat: Drinkable {
    func drink() {
        print("\(type(of: self)) \(self.name) drink milk")
    }
}

class Dog: Animal, Eatable {
}

class Monkey: Animal, Drinkable {
}

Test.run {
    let animals: [Animal] = [Cat("miao~🐈"), Dog("wang~🐶"), Monkey("six~🐒")]
    for animal in animals {
        animal.run()
        if let animal = animal as? Eatable {
            animal .eat()
        }
        if let animal = animal as? Drinkable {
            animal .drink()
        }
    }
}
