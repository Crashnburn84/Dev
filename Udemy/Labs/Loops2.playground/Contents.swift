//: Playground - noun: a place where people can play

import UIKit

/*
func beerSong(_ totalNumberOfBottles: Int) -> String {
    var lyrics: String = ""

    for number in (1...totalNumberOfBottles).reversed() {
        let newLine: String = "\n\(number) bottles of beer on the wall, \(number) bottles of beer. \nTake one down and pass it around, \(number - 1) bottles of beer on the wall.\n"
        lyrics += newLine
    }

    lyrics += "\nNo more bottles of beer on the wall, no more bottles of beer. \nGo to the store and buy some more, \(totalNumberOfBottles) bottles of beer on the wall.\n"

    return lyrics
}

print(beerSong(6))
*/
 
/*
 FIBONACCI NUMBERS
 
 n = 5
 
 0,1,1,2,3,5,8
 */

func fibonacci(until n: Int) {
    print(0)
    print(1)
    
    var num1 = 0
    var num2 = 1
    
    for _ in 0...n {
        let num = num1 + num2
        print(num)
        
        num1 = num2
        num2 = num
    }
}

fibonacci(until: 20)
