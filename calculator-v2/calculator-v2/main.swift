//
//  main.swift
//  calculator-v2
//
//  Created by ishansaksena on 4/5/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation

// Elementary operations
func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func subtract(n1: Int, n2: Int) -> Int {
    return n1 - n2
}

func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

func divide(n1: Int, n2: Int) -> Int {
    return n1 / n2
}

// General binary math operation
func mathOp(n1: Int, n2: Int, func elemOp: (Int, Int) -> Int) -> Int{
    return elemOp(n1, n2)
}

// Operations for arrays
// Adds the elements in the array
func arrAdd (n: [Int]) -> Int {
    var result = 0
    for number in n {
        result += number
    }
    return result
}

// Multiplies the elements in the array
func arrMultiply(n: [Int]) -> Int {
    var result = 1
    for number in n {
        result *= number
    }
    return result
}

// counts the number of elements in the array
func count(n: [Int]) -> Int {
    return n.count
}

// Returns the average of the elements in the array
func avg(n: [Int]) -> Int {
    return arrAdd(n) / count(n)
}

// General math operation for array of numbers
func mathOp(n: [Int], func op: (n: [Int]) -> Int) -> Int {
    return op(n: n)
}

// Operations on tuples
// To represent x,y tuples
typealias xy = (Int, Int)
// Adds corresponding values in x,y tuples
func addTuples(t1: xy, t2: xy) -> xy {
    return (t1.0 + t2.0, t1.1 + t2.1)
}

// Subtracts corresponding values in x,y tuples
func subtractTuples(t1: xy, t2: xy) -> xy {
    return (t1.0 - t2.0, t1.1 - t2.1)
}

// Operations with tuples as dictionaries
typealias xyDict = [String: Double]

func addDict(d1: xyDict, d2: xyDict) -> xyDict? {
    if checkDict(d1, d2: d2) {
        print("You're clownin'")
        return nil
    }
    var result = ["x" : d1["x"]! + d2["x"]!]
    result["y"] = d1["y"]! + d2["y"]!
    return result
}

func subtractDict(d1: xyDict, d2: xyDict) -> xyDict? {
    if checkDict(d1, d2: d2) {
        print("You done goofed!")
        return nil
    }
    var result = ["x" : d1["x"]! - d2["x"]!]
    result["y"] = d1["y"]! - d2["y"]!
    return result
}

func checkDict(d1: xyDict, d2: xyDict) -> Bool {
    if d1["x"] != nil && d2["x"] != nil && d1["y"] != nil && d2["y"] != nil {
        return false
    }
    return true
}

// Tests
print("Testing binary operations")
print("add(3, 2) is \(add(3, n2: 2))")
print("subtract(6, 3) is \(subtract(6, n2: 3))")
print("multiply(5, 4) is \(multiply(5, n2: 4))")
print("divide(10, 5) is \(divide(10, n2: 5))")

print()
print("Testing binary operations with general math op method")
print("add(3, 2) is \(mathOp(3, n2: 2, func: add))")
print("subtract(6, 3) is \(mathOp(6, n2: 3, func: subtract))")
print("multiply(5, 4) is \(mathOp(5, n2: 4, func: multiply  ))")
print("divide(10, 5) is \(mathOp(10, n2: 5, func: divide))")

print()
print("Testing array operations: ")
print("adding array [1, 2, 3, 4] is \(arrAdd([1, 2, 3, 4]))")
print("multiplying array [1, 2, 3, 4] is \(arrMultiply([1, 2, 3, 4]))")
print("count of array [1, 2, 3, 4] is \(count([1, 2, 3, 4]))")
print("average of array [1, 2, 3, 4] is \(avg([1, 2, 3, 4]))")

print()
print("Testing array operations with general math op method: ")
print("adding array [1, 2, 3, 4] with general method is \(mathOp([1, 2, 3, 4], func: arrAdd))")
print("multiplying array [1, 2, 3, 4] with general method is \(mathOp([1, 2, 3, 4], func: arrAdd))")
print("count of array [1, 2, 3, 4] with general method is \(mathOp([1, 2, 3, 4], func: count))")
print("average array [1, 2, 3, 4] with general method is \(mathOp([1, 2, 3, 4], func: avg))")

print()
print("Testing point operations with tuples")
print("Adding tuples (1, 2), (3, 4) is \(addTuples((1, 2), t2: (3, 4)))")
print("Subtracting tuples(1, 2), (3, 4) is \(subtractTuples((1, 2), t2: (3, 4)))")

print()
print("Testing point operations with dictionaries")
print("Adding tuples (1, 2), (3, 4) is \(addDict(["x": 1, "y":2], d2: ["x": 3, "y":4])!)")
print("Subtracting tuples(1, 2), (3, 4) is \(subtractDict(["x": 1, "y":2], d2: ["x": 3, "y":4])!)")

print()
print("Testing point operations with dictionaries, with decimals and negative numbers")
print("Adding tuples (1.0, 2.5), (3.4, -4) is \(addDict(["x": 1.0, "y":2.5], d2: ["x": 3.9, "y":-4])!)")
print("Subtracting tuples(1, 2), (3, 4) is \(subtractDict(["x": 1, "y":2], d2: ["x": 3, "y":4])!)")

print()
print("Testing point operations with dictionaries, with dictionaries without x or y values")
var added: xyDict? = addDict(["x": 1.0], d2: ["x": 3.9, "y":-4])
if (added != nil) {
    print("Adding tuples (1.0, 2.5), (3.4, -4) is \(added)")
}
var subtracted: xyDict? = subtractDict(["x": 1, "y":2], d2: ["y":4])
if (subtracted != nil) {
    print("Subtracting tuples(1, 2), (3, 4) is \(subtracted)")
}
