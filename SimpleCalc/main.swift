//
//  main.swift
//  SimpleCalc
//
//  Created by Weschler, Sabrina on 10/7/15.
//  Copyright (c) 2015 Weschler, Sabrina. All rights reserved.
//

import Foundation

println("Enter an expression separated by returns:")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}

func avg(nums: [Double]) -> Double {
    var sum = 0.0
    for num in nums {
        sum += num
    }
    return Double(sum) / Double(nums.count)
}

func fact(n: Double) -> Double {
    if n == 0 {
        return 1
    } else {
        return n * fact(n-1)
    }
}


func basicOperation(firstNumber: Double, operation: String, secondNumber: Double) -> Double {
    switch operation {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        case "%":
            return firstNumber % secondNumber
        default:
            return 0
    }
}

func logic() {
    let enteredText = split(input()) {$0 == " " }
    
    var listOfNumbers: [Double] = []
    for value in enteredText {
        listOfNumbers.append(convert(value))
    }
    let operation = input()
    if enteredText.count > 1 {
        if operation == "avg" {
            print(avg(listOfNumbers))
        }else if operation == "count" {
            print(enteredText.count)
        } else {
            print("Number entered could not be processed.")
        }
    } else {
        let firstNumber = convert(enteredText[0])
        
        if operation == "fact" {
            if firstNumber < 0 {
                print("-\(fact(abs(firstNumber)))")
            } else {
                print("results: \(abs(fact(firstNumber)))")
            }
        }
        
        let secondNumber: Double = convert(input())
        
        print("result: \(basicOperation(firstNumber, operation, secondNumber))")

    }
}
logic()













