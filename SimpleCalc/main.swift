//
//  main.swift
//  SimpleCalc
//
//  Created by Weschler, Sabrina on 10/7/15.
//  Copyright (c) 2015 Weschler, Sabrina. All rights reserved.
//

import Foundation
import Darwin


func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

//Converts string into Doubles
func convert(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}
// Calculates the averages of a list of numbers
func avg(nums: [Double]) -> Double {
    var sum = 0.0
    for num in nums {
        sum += num
    }
    return Double(sum) / Double(nums.count)
}
//Caculates the factorial
func fact(n: Double) -> Double {
    if n == 0 {
        return 1
    } else {
        return n * fact(n-1)
    }
}

//fucntion that calculates the basic operations (add, sub, mul, div, mod)
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
            return DBL_MAX //Number that you would never reach.
    }
}

//All the logic is in the main function. 

func main() {
    println("Enter an expression separated by returns:")

    //taking the string of numbers and splitting in into an array.
    let enteredText = split(input()) {$0 == " " }
    
    //Populates listOfNumbers with double values from the array of String in enteredText.
    var listOfNumbers: [Double] = []
    for value in enteredText {
        listOfNumbers.append(convert(value))
    }
    
    //Handles when there are multiple numbers in a row to calculate avg and count.
    let operation = input()
    if enteredText.count > 1 {
        if operation == "avg" {
            print(avg(listOfNumbers))
        }else if operation == "count" {
            print(enteredText.count)
        } else {
            print("Number entered could not be processed.")
        }
    } else { //Case: when it is one number per line and it will calculate the factorial and basic operations.
        let firstNumber = convert(enteredText[0])
        
        if operation == "fact" {
            if firstNumber < 0 {
                print("Cannot calculate a factorial of a negative number.")
            } else {
                print("results: \(fact(firstNumber))")
            }
        }
        
        let secondNumber: Double = convert(input())
        
    
    let output = basicOperation(firstNumber, operation, secondNumber)
        //This checks for an invlaid operator. Returns DBL_MAX if there is an error.
        if output != DBL_MAX {
            print("result: \(basicOperation(firstNumber, operation, secondNumber))")
        } else  {
            print("invalid operator.")
        }

    }
}
main()

















