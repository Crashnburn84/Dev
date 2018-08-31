import UIKit

private let textInset = CGPoint(x: 12, y: 8)

//extension UIView
//{
//    @IBInspectable var cornerRadius: CGFloat {
//        get {  }
//        set {  }
//    }
//}

@IBDesignable
class CoolCell: UIView
{
    class var textAttributes: [NSAttributedStringKey: Any] {
        return [.font: UIFont.boldSystemFont(ofSize: 20),
                .foregroundColor: UIColor.white]
    }
    
    @IBInspectable var text: String? {
        didSet { sizeToFit() }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get { return UIColor(cgColor: layer.borderColor!) }
        set{ layer.borderColor = newValue?.cgColor }
    }
    
    var highlighted: Bool = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayer()
        configureGestureRecognizer()
    }
    
    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = true
    }
    
    private func configureLayer() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func configureGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
}

// MARK: Core Animation
extension CoolCell
{
    @objc func bounce() {
        animateBounce(duration: 1, size: CGSize(width: 0, height: 240))
       // print("In \(#function)")
    }
    
    func animateBounce(duration: TimeInterval, size: CGSize) {
        
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in self?.configureBouce(size: size) },
                       completion: { [weak self] _ in self?.animateFinishBounce(duration: duration, size: size)})
    }
    
    func configureBouce(size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        transform = translation.rotated(by: .pi / 2 )
    }
    
    func animateFinishBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = .identity
        }
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
//        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: nil)
        let prevLocations = touch.previousLocation(in: nil)
        
        center.x += location.x - prevLocations.x
        center.y += location.y - prevLocations.y
        
//        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        finishTouch(touches.first)
//        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        finishTouch(touches.first)
//        super.touchesCancelled(touches, with: event)
    }
    
    func finishTouch(_ touch: UITouch?) {
        highlighted = false
    }
    
}
