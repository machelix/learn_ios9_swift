//: Playground - noun: a place where people can play

import UIKit

let aNum = "123"
let num = Int(aNum)

print(num)

print(num!)

var name: String?

print(name)

name = "John"

if name != nil {
    let newname = name
    print("name is \(newname)")
} else {
    print("name is nil")
}

name = "John"
print(name!)
