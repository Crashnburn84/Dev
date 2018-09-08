//func getMilk() {
//    print("Go to the shops")
//    print("Buy two cartons of milk")
//    print("Pay $2.00")
//    print("Come Home")
//}

//func getMilk(howManyMilkCartons : Int) {
//    print("Go to the shops")
//    print("Buy \(howManyMilkCartons) cartons of milk")
//
//    let priceToPay = howManyMilkCartons * 2
//
//    print("Price to Pay: $\(priceToPay)")
//    print("Come Home")
//}

func getMilk(howManyMilkCartons: Int, howMuchMoneyGiven: Int) -> Int{
    let priceToPay = howManyMilkCartons * 2
    let change = howMuchMoneyGiven - priceToPay
    
    print("Robot, Please go to the Store!")
    print("Buy \(howManyMilkCartons) cartons of Milk")
    print("Price to Pay: $\(priceToPay) for Milk")
    print("Come Home")
    
    return change
}

var amountOfChange = getMilk(howManyMilkCartons : 1, howMuchMoneyGiven: 10)
print("Hello master, here is your $\(amountOfChange) change")

