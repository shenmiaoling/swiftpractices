//: Playground - noun: a place where people can play

import Cocoa
//import UIKit

var str = "Hello, playground"

class Door {
    var opened : Bool = false
    var locked : Bool = false
    let width : Int
    let height : Int
    let weight : Int
    let color : String
    let name : String
    
    init(name: String, width : Int = 32,height : Int = 72, weight : Int = 10,color : String = "Red") {
        self.name = name
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open() -> String {
        opened = true
        return "the door is open!"
    }
    func lock() -> String {
        locked = true
        return "the door is locked!"
    }
    func close() -> String {
        opened = true
        return "the door is close!"
    }
    func unlock() -> String {
        locked = false
        return "the door is unlock!"
    }
}
let frontdoor = Door(name:"10",color: "pink")
print(frontdoor)
class NiceDoor : Door{
    init(width: Int = 32,height: Int = 12,weight: Int = 22,color: String = "gray") {
        super.init(name: "door",width: width,height: height,weight:weight,color:color)
    }
}
class NiceWindow : Door{
    init(width: Int = 32,height: Int = 12,weight: Int = 22,color: String = "green") {
        super.init(name: "window",width: width,height: height,weight:weight,color:color)
    }
}

let sunRoomDoor = NiceDoor()
sunRoomDoor.name

let bayWindow = NiceWindow(width:11)
bayWindow.width
bayWindow.name

class Tractor {
    let horsePower : Int
    let color : String
    init(horsePower : Int,color : String)
    {
        self.horsePower = horsePower
        self.color  = color
    }
    convenience init(horsePower : Int)
    {
    self.init(horsePower : horsePower,color : "Green")
    }
    convenience init() {
        self.init(horsePower: 42,color: "Green")
    }
}
let a = Tractor()
let b = Tractor(horsePower:71)
let c = Tractor(horsePower: 11,color: "lightblue")
c.color
c.horsePower
b.horsePower

//枚举
enum FuelType{
    case Gasoline
    case Diesel
    case Biodiesel
    case Eletric
    case NaturalGas
}
var engine : FuelType = .Gasoline
var vehicleName : String

switch engine {
case .Gasoline:
    vehicleName = "Ford F-150"
case .Diesel:
    vehicleName = "Ford F-250"
case .Biodiesel:
    vehicleName = "Custom Van"
case .Eletric:
    vehicleName = "Toyota Prius"
case .NaturalGas:
    vehicleName = "Utility Truck"
}
print("Vehicle \(vehicleName) takes \(engine)")

//结构
struct Resolution {
    var width = 0
    var heught = 0
}
let someResolution = Resolution()
print(someResolution.width)

//类和结构 => 引用类型和值类型

struct structor {
    var copyVar : Int = 10
}
var struct1 = structor()
var struct2 = struct1
struct2.copyVar = 20
struct1.copyVar
struct2.copyVar

class Class{
    var copyVar : Int = 10
}
var class1 = Class()
var class2 = class1
class2.copyVar = 20
class1.copyVar
class2.copyVar
