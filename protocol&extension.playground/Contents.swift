//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
//协议和扩展
protocol lockUnlockProtocol {
    func lock() -> String
    func unlock() -> String
}

class House : lockUnlockProtocol {
    func lock() -> String {
        return "Click!"
    }
    func unlock() -> String {
        return "Clack!"
    }
}
class Vehicle : lockUnlockProtocol {
    func lock() -> String {
        return "Beep-Beep!"
    }
    func unlock() -> String {
        return "Beep!"
    }
}
let myHouse = House()
myHouse.lock()
myHouse.unlock()

let myCar = Vehicle()
myCar.lock()
myCar.unlock()
// get set
protocol newLockUnlockProtocol {
    var locked : Bool {get set}
    func lock() -> String
    func unlock() -> String
}
class safe : newLockUnlockProtocol{
    var locked : Bool = false
    func lock() -> String {
        locked = true
        return "Ding!"
    }
    func unlock() -> String {
        locked = false
        return "Dong!"
    }
}
let mySafe = safe()
mySafe.lock()
mySafe.unlock()
mySafe.locked
//使用协议实现委托
protocol VendingMachineProtocol {
    var coinInsert : Bool { get set }
    func shouldVend() -> Bool
}
class Vendor : VendingMachineProtocol {
    var coinInsert: Bool = false
    func shouldVend() -> Bool {
        if coinInsert == true {
            coinInsert = false
            return true
        }
        return false
    }
}
class ColaMachine {
    var vendor : VendingMachineProtocol
    init(vendor : VendingMachineProtocol) {
        self.vendor = vendor
    }
    func insertCoin() {
        vendor.coinInsert = true
    }
    func pressColaButton() -> String {
        if vendor.shouldVend() == true {
            return "Here's a Cola!"
        }
        else {
            return "You must insert a coin!"
        }
    }
    func PressRoorBeerButton() -> String {
        if vendor.shouldVend() == true{
            return "Here's a Root Beer!"
        }
        else {
            return "You must insert a coin!"
        }
    }
}
var vendingMachine = ColaMachine(vendor : Vendor())
vendingMachine.pressColaButton()
vendingMachine.insertCoin()
vendingMachine.PressRoorBeerButton()
vendingMachine.pressColaButton()
vendingMachine.insertCoin()
vendingMachine.pressColaButton()
//扩展
//为整数型添加扩展属性
extension Int {
    func times(block: ()->()) {
        for item in 0...self {
            print(item)
            block()
        }
    }
}
3.times {
//    print("hi")
}

extension Int {
    var kb : Int { return self * 1_024}
    var mb : Int { return self * 1_021 * 1_024}
    var gb : Int { return self * 1_024 * 1_024 * 1_024}
}
var x : Int = 1.kb
var y = 8.mb
var z = 2.gb

//为Double添加扩展属性

extension Double {
    var F : Double { return self}
    var C : Double { return (((self - 32.0) * 5.0) / 9.0)}
    var K : Double { return (((self - 32.0) / 1.8) + 273.15)}
}
var f = 80.4.F
var c = f.C
var k = f.K

//为 String 添加扩展属性

extension String {
    func prependString ( value : String) -> String {
        return value + self
    }
    func appendString (value : String) -> String {
        return self + value
    }
}
"x".prependString(value : "prefix")
"y".appendString(value: "postfix")
//关键字 mutating 修改 self 的值

extension Int {
    mutating func triple(){
        self = self * 3
    }
}
var trip = 3
trip.triple()
trip

extension String {
    mutating func decorate(){
        self = "***" + self + "***"
    }
}
var testString = "decorete"
testString.decorate()
testString
//在扩展中使用闭包
extension Int {
    //work : () -> String 是一个最简单的闭包
    func repeater( _ work : () -> String) {
        for _ in 0..<self{
            work()
        }
    }
}
5.repeater({return "repeat this string"})


