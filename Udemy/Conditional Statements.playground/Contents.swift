import UIKit

//func loveCalculator(yourName: String, theirName: String) -> String
//{
//    let loveScore = arc4random_uniform(101)
//
//    if loveScore > 80 {
//        return "Your love score is \(loveScore). ❤️ Lovers!"
//    }
//    else if loveScore > 40 && loveScore <= 80 {
//        return "Your love score is \(loveScore). With some work, love may find a way!"
//    }
//
//    else {
//        return "Your love score is \(loveScore). 💔 Run Away!"
//    }
//}
//
//print(loveCalculator(yourName: "Robert Koprowski", theirName: "Erica Russell"))

//
//func bmiCalculator(weight: Double, height: Double) -> String {
//    let bmiNumerator = weight
//    let bmiDenominator = height * height
//    let bmiValue = bmiNumerator / bmiDenominator
//
//    if bmiValue > 25 {
//        return "Body Mass Index: \(bmiValue) | Your are Overweight!"
//    }
//    else if bmiValue > 18.5 && bmiValue <= 25 {
//        return "Body Mass Index: \(bmiValue) | Your weight is normal!"
//    }
//    else {
//        return "Body Mass Index: \(bmiValue) | You are underwieght! Eat Something!"
//    }
//}
//
//print(bmiCalculator(weight: 77, height: 1.75))

// 1 foot = 12 inches
// 1 inch = 0.0254 meters
// 1 pound = 0.45359237 kilograms

func bmiCalcImperialUnits(weightInPounds: Double, heightInFeet: Double, heightInInches: Double) -> Double {
    let weightInKg = weightInPounds * 0.45359237
    let heightInInchesTotal = (heightInFeet * 12) + heightInInches
    let heightInMeters = heightInInchesTotal * 0.0254
    let bmiImperial = weightInKg / pow(heightInMeters, 2)
    
    return bmiImperial
}

bmiCalcImperialUnits(weightInPounds: 200, heightInFeet: 5, heightInInches: 9)


func calcBMI(weight: Double, height: Double) -> String {
    let bmi = weight / pow(height, 2)
    var interpretation = ""
    
    let shortenBMI = String(format: "%.2f", bmi)
    
    if bmi > 25 {
        interpretation = "Your are Overweight!"
    }
    else if bmi > 18.5 && bmi < 25 {
        interpretation = "Your weight is normal!"
    }
    else {
        interpretation = "You are underwieght! Eat Something!"
    }
    return "Your Body Mass Index is \(shortenBMI) and \(interpretation)"
}

var bmiResult = calcBMI(weight: 99
    , height: 1.80)
print(bmiResult)
