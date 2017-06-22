//: Playground - noun: a place where people can play

import Cocoa

func fahrenheitToCelsius(fahrenheitValue : Double) -> Double {
    var result : Double
    result = (((fahrenheitValue - 32) * 5) / 9)
    return result
}
var outdoorTemperatureInFahrenheit = 88.2
var outdoorTemperatureInCeelsius = fahrenheitToCelsius( fahrenheitValue: outdoorTemperatureInFahrenheit)
func sheshiduToHuashiDu (sheShidu : Double) -> Double {
    var result : Double
    result = (sheShidu * 9 / 5) + 32
    return result
}
var sheshidu = 31.2
var result = sheshiduToHuashiDu(sheShidu: sheshidu)
func string (a : String, b : String, c : String)-> String {
    print(a + " " + b + " " + c)
    return a + " " + b + " " + c
}
string(a : "swift", b : "is", c : "cool")
func add(balances : Double...) -> Double {
    var result : Double = 0
    for balance in balances {
        result += balance
    }
    return result
}
add(balances: 1, 2)
func findLarge(balances : Double...) -> Double{
    var result : Double = -Double.infinity
    for balance in balances {
        if balance > result {
        result = balance
        }
    }
    return result
}
findLarge(balances: 12,11,1000)
var account1 = ("State Bank Personal", 1011.10)
var account2 = ("State Bank business", 24309.63)
func deposit(amount : Double, account : (name : String,balance : Double)) -> (String,Double) {
    let newBalance : Double = account.balance + amount
    return (account.name , newBalance)
}
func withdraw(amount : Double, account : (name : String,balance : Double)) -> (String,Double) {
    let newBalance : Double = account.balance - amount
    return (account.name , newBalance)
}
let monday = deposit
let mondayBalance = monday(100.0,account1)
func chooseTransaction (tansaction : String) -> (Double, (String, Double)) -> (String, Double){
    if tansaction == "deposit" {
        return deposit
    }else {
        return withdraw
    }
}
let myTransaction = chooseTransaction(tansaction:"deposit")
myTransaction(228.4, account2)
chooseTransaction(tansaction: "withdraw")(63.7,account1)
func writeCheck (name : String = "unknow", amount: String = "10.00") -> String{
    return "Check payable to \(name) for $ \(amount)"
}
writeCheck()
writeCheck(name: "vara")
writeCheck(name: "vara", amount: "20.00")
func addTwoNumber ( _ num1: Double, _ num2: Double) -> Double{
    return num1 + num2
}
addTwoNumber(1.0, 2.0)

func cashCheck ( _ from: String, to: String, total: Double) -> String {
    var anotherTo = to
    if(to == "Cash"){
        anotherTo = from
    }
    return "Check payable from \(from) to \(anotherTo) for $\(total) has been cash"
}
cashCheck("Jason", to:"Cash", total: 11.0)

func cashBetterCheck ( _ from: String, to: inout String, total: Double) -> String {
    if(to == "Cash"){
        to = from
    }
    return "Check payable from \(from) to \(to) for $\(total) has been cash"
}
var payer = "Json"
var payee = "Cash"
print(payee)
cashCheck(payer, to: payer, total: 11.0)

//闭包
let nums = [2,5,3,6,9,0]
let numsSort  = nums.sorted()

func backward ( _ s1 : Int, _ s2 : Int) -> Bool {
    return s1 > s2
}
let numsSort1 = nums.sorted(by: backward)

let sortNums2 = nums.sorted(by: { (n1: Int, n2: Int) -> Bool in
    return n1 > n2
})
print(sortNums2)

let sortNums3 = nums.sorted(by:{n1,n2 in return n1 < n2})
print(sortNums3)

let sortNums4 = nums.sorted(by: {n1,n2 in n1>n2})
print(sortNums4)

let sortNum5 = nums.sorted(by: {$0>$1})
print(sortNum5)

let sortNum6 = nums.sorted(by: <)
print(sortNum6)

let simple = {(a : Double, b: inout Double, c : Int) -> Double in
    b = b / 100.0
    var i = Double(c) * b * a
    return a + i
}
func loanCalculator(a: Double, b : Double, c: Int, calculator: (Double, Double,Int) -> Double) -> Double {
    let total = calculator(a,b,c)
    return total
}
var a : Double = 12.0