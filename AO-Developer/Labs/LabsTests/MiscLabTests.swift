//
//  MiscLabTests.swift
//  LabsTests
//
//  Created by Robert Koprowski on 8/28/18.
//  Copyright © 2018 Robert Koprowski. All rights reserved.
//
import XCTest

enum MathError: Error {
    case zeroDivide
    case overflow
}

extension Double
{
    func divided(by denominator: Double) throws -> Double {
        if denominator == 0.0 {
            throw MathError.zeroDivide
        }
        return self / denominator
    }
}

class MiscLabTests: XCTestCase {

    func testDoCatchTry() {
        do {
            //let result = try 42.divided(by: 0)
            //print("result is \(result)")
            let result1 = try 42.divided(by: 2)
            print("result 1 is \(result1)")
            let result2 = try result1.divided(by: 3)
            print("result 2 is \(result2)")
        }
        catch MathError.zeroDivide {
            print("Zero divide")
        }
        catch MathError.overflow {
            print("Overflow")
        }
        catch {
            print ("Unexpected error")
        }
    }
    
    func testImplicitTry() {
        let x = try! 12.divided(by: 1.25)
        print(x)
    }
}
