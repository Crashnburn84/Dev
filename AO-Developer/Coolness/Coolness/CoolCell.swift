import UIKit

private let textInset = CGPoint(x: 12, y: 8)

class CoolCell: UIView
{
    class var textAttributes: [NSAttributedStringKey: Any] {
        return [.font: UIFont.boldSystemFont(ofSize: 20),
                .foregroundColor: UIColor.white]
    }
    
    var text: String? {
        didSet { sizeToFit() }
    }
    
    var highlighted: Bool = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
}

// MARK: Custom drawing
extension CoolCell
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(withAttributes: type(of: self).textAttributes)
        newSize.width += textInset.x * 2
        newSize.height += textInset.y * 2
        return newSize
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textInset, withAttributes: type(of: self).textAttributes)
    }
}

// MARK: UIResponer methods
extension CoolCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubview(toFront: self)
        highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: nil)
        let prevLocations = touch.previousLocation(in: nil)
        
        //let dx = location.x - prevLocations.x
        //let dy = location.y - prevLocations.y
        
        //print("In \(#function), \(touch), \(location)")
        center.x += location.x - prevLocations.x
        center.y += location.y - prevLocations.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        finishTouch(touches.first)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        finishTouch(touches.first)
    }
    
    func finishTouch(_ touch: UITouch?) {
        highlighted = false
    }
    
}
