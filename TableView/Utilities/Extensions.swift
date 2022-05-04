import UIKit

extension CALayer {                                             // MARK: - CA_LAYER
    
    open func setBorder() {
        self.borderWidth = 1
        self.borderColor = UIColor.black.cgColor
        self.cornerRadius = self.frame.height/2
    }
     
}

 
class DrawCircles: UIImageView {                                // MARK: - UI_IMAGE_VIEW
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get graphics context")
            return
        }
        context.setLineWidth(2)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addEllipse(in: CGRect(x: 30, y: 30, width: 50.0, height: 50.0))
        context.strokePath()
        context.setStrokeColor(UIColor.red.cgColor)
        context.beginPath() // prevents a straight line from being drawn from current point to arc
        let cgpoint = CGPoint(x:100, y: 100)
        context.addArc(center: cgpoint,
                       radius: 20,
                       startAngle: 0,
                       endAngle: 2.0*CGFloat.pi,
                       clockwise: false)
        context.strokePath()
    }
}





