import XCTest
@testable import Labs

// Array of temperature values established for Unit Testing
let temperatureValues: [Double] = [-10,0,10,32,72,100]

// Function to convert ºF to ºC
func convertedToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * (5/9)
}
// Function to convert ºC to ºF
func convertedToFahrenheit(celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

// ********************************** TEST CASES **********************************

// Established Unit Test Cases using above functions.
class FunctionsLabsTests: XCTestCase
{
    func testConvertFahrenheitToCelsius() {
        for value in temperatureValues {
            let celsius = convertedToCelsius(fahrenheit: value)
            let formattedValue = String(format: "%.1f",celsius)
            print("\(value)ºF equals \(formattedValue)ºC")
        }
    }
    
    func testConvertCelsiusToFahrenheit() {
        for value in temperatureValues {
            let fahrenheit = convertedToFahrenheit(celsius: value)
            let formattedValue = String(format: "%.1f",fahrenheit)
            print("\(value)ºC equals \(formattedValue)ºF")
        }
    }
}
