

//: Playground - noun: a place where people can play

import Cocoa

//var str = "Hello, playground"
var trafficLight = "red"
if trafficLight == "red" {
    print("stop")
}else{
    print("go")
}

var number1 :Int = 11
var number2 :Int = 22
if number1 >= number2 {
    print("\(number1) is greater than \(number2)")
}else{
    print("\(number1) is less than \(number2)")
}
var tree1 = "Oak"
var tree2 = "Pecan"
var tree3 = "Maple"
let treeCompare1 = tree1 > tree2
let treeCompare2 = tree2 > tree3
var treeArray = [tree1,tree2,tree3]
//for tree in treeArray {
//    if tree == "Oak" {
//        print("Furniture")
//    }
//    else if tree == "Pecan" {
//        print("Pie")
//    }
//    else {
//        print("Syrup")
//    }
//}
treeArray += ["cherry"]
for tree in treeArray {
    switch tree {
    case "Oak":
        print("Furniture")
    case "Pecan","cherry":
        print("Pie")
    case "Maple":
        print("Syrup")
    default:
        print("wood")
    }
}
var base = 2
var target = 1000
var value = 0
while value < target {
    value += base
}

repeat {
    value += base
}while value < target

var speedLimit = 75
var carSpeed = 0
while (carSpeed < 100) {
    carSpeed += 1
    
    switch carSpeed {
    case 0..<20:
        print("\(carSpeed): slow")
    case 20..<30:
        print("\(carSpeed): pace")
    case 30..<40:
        print("\(carSpeed): accelerator")
    case 40..<50:
        print("\(carSpeed): stride")
    default:
        print("\(carSpeed) you're going so fast!!")
    }
    if carSpeed > speedLimit {
        break
    }
}
