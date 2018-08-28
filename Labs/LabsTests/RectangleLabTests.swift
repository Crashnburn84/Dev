import XCTest

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 2.0
    var height = 4.0
}

struct Rectangle {
    var size: Size
    var origin: Point
    
    var area: Double {
        return size.width * size.height
    }
    
    var center: Point {
        let myCenter = Point(x: (origin.x + size.width)/2, y: (origin.y + size.height)/2)
        return myCenter
    }
    
    func offsetBy(dx: Double, dy: Double) -> Rectangle {
        let newOrigin = Point(x: origin.x + dx, y: origin.y + dy)
        let newRectangle = Rectangle(size: size, origin: newOrigin)
        return newRectangle
    }
}

let size = Size(width: 2.0, height: 4.0)
let point = Point(x: 10.0, y: 12.0)
let myRect = Rectangle(size: size, origin: point)

// ********************************** TEST CASES **********************************

class RectangleLabTests: XCTestCase {

    func testRectangleArea() {
        print()
        print(myRect)
        print()
    }
    
    func testOffsetBy() {
        let newRectangle = myRect.offsetBy(dx: 5.0, dy: 5.0)
        print()
        print(newRectangle)
        print()
    }
}
