//
//  mageIndicatorShapes.swift
//  mageIndicator
//
//  Created by cedcoss on 27/04/21.
//

import Foundation
import UIKit
enum mageIndicatorShapes{
    case line
    case circle
    case ring
    case ringDown
    case ringUp
    case circleUp
    case circleDown
    case ringThreeFourth
    case lineToRotate
    case verticalLine
    case ringRight
    case ringLeft
    func layerWith(size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        var path: UIBezierPath = UIBezierPath()
        let lineWidth:CGFloat=2.5
        switch self{
        case .line:
            path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height),
                                cornerRadius: size.width / 2)
            layer.fillColor = color.cgColor
        case .circle:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat(2 * Double.pi),
                        clockwise: false)
            layer.fillColor = color.cgColor
       
        case .ring:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat( Double.pi*2),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringDown:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(Double.pi/4),
                        endAngle: CGFloat(Double.pi*3/4),
                        clockwise: true)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringUp:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-Double.pi/4),
                        endAngle: CGFloat(-Double.pi*3/4),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringRight:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: CGFloat(Double.pi/4), endAngle: CGFloat(-Double.pi/4), clockwise: false)
            layer.fillColor=nil
            layer.strokeColor=color.cgColor
            layer.lineWidth=2.5
        case .ringLeft:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: CGFloat(-Double.pi*3/4), endAngle: CGFloat(-Double.pi*5/4), clockwise: false)
            layer.fillColor=nil
            layer.strokeColor=color.cgColor
            layer.lineWidth=2.5
        case .circleUp:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-Double.pi/4),
                        endAngle: CGFloat(-Double.pi*3/4),
                        clockwise: false)
            layer.fillColor = color.cgColor
        case .circleDown:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(Double.pi/4),
                        endAngle: CGFloat(Double.pi*3/4),
                        clockwise: true)
            layer.fillColor = color.cgColor
        case .ringThreeFourth:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-3 * Double.pi / 4),
                        endAngle: CGFloat(-Double.pi / 4),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = 3
        case .lineToRotate:
            path = UIBezierPath(roundedRect: CGRect(x: 0, y: size.height/2-3, width: size.width, height: 6),cornerRadius: 3)
            layer.fillColor=color.cgColor
        case .verticalLine:
            path=UIBezierPath(roundedRect: CGRect(x: size.width/2-3, y: 0, width: 6, height: size.height), cornerRadius: 3)
            layer.fillColor = color.cgColor
        }
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }
}
