//
//  mageIndicator.swift
//  mageIndicator
//
//  Created by cedcoss on 27/04/21.
//

import Foundation
import UIKit
public enum activityAnimatorTypes{
    case lineUpDown
    case circeRoundRound
    case lineRoundRound
    case threeDots
    case lineMovinglikeFlag
    case musicBeat
    case expandingRing
    case multipleRing
    case wifiConnect
    case waterDrop
    case singleBubble
    case multipleBubble
    case seaWave
    case stoneDrop
    case rotatingArc
    case rotatingWheel
    case rotatingWheelWithScale
    case rotatingSemiArcWithball
    case rotatingArcwithArc
    case rotatingBalls
}

public final class mageIndicator:UIView{
    public  static var defaultColor=UIColor.white

    var color=mageIndicator.defaultColor
    public func stopAnimation(in view:UIView){
        isHidden=true
        layer.sublayers?.removeAll()
        view.viewWithTag(17177)?.removeFromSuperview()
    }
    public func addAnimationView(in view:UIView,frame:CGRect, color: UIColor?,secondaryColor:UIColor?, types:activityAnimatorTypes){
        view.viewWithTag(17177)?.removeFromSuperview()
        let contentView=UIView()
        contentView.tag=17177
        contentView.backgroundColor=UIColor.gray.withAlphaComponent(0.5)
        view.addSubview(contentView)
        contentView.frame=view.bounds
        
        isHidden=false
        layer.speed=1
        var animationRect=frame
        let minEdge = min(animationRect.size.width, animationRect.size.height)
        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        let x = animationRect.minX
        let y = animationRect.minY
        switch types {
        case .lineUpDown:
            let lineSize = animationRect.size.width / 9
            let duration: CFTimeInterval = 1
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0.1, 0.2, 0.3, 0.4, 0.5]
            let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)

            // Animation
            let animation2 = CAKeyframeAnimation(keyPath: "transform.scale.y")
            animation2.keyTimes = [0, 0.5, 1]
            animation2.timingFunctions = [timingFunction, timingFunction]
            animation2.values = [1, 0.4, 1]
            animation2.duration = duration
            animation2.repeatCount = HUGE
            animation2.isRemovedOnCompletion = false

            // Draw lines
            for i in 0 ..< 5 {
                let line = mageIndicatorShapes.line.layerWith(size: CGSize(width: lineSize, height: animationRect.size.height), color: color ?? self.color)
                let frame = CGRect(x:x + lineSize * 2 * CGFloat(i), y: y, width: lineSize, height: animationRect.size.height)

                animation2.beginTime = beginTime + beginTimes[i]
                line.frame = frame
                line.add(animation2, forKey: "animation")
                layer.addSublayer(line)
            }
            contentView.layer.addSublayer(layer)
        case .lineMovinglikeFlag:
            let lineSize = animationRect.size.width / 9
            let duration: CFTimeInterval = 1
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0.1, 0.2, 0.3, 0.4, 0.5]
            let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)

            // Animation
            let animation2 = CAKeyframeAnimation(keyPath: "transform.scale.x")

            animation2.keyTimes = [0, 0.5, 1]
            animation2.timingFunctions = [timingFunction, timingFunction]
            animation2.values = [1, 0.4, 1]
            animation2.duration = duration
            animation2.repeatCount = HUGE
            animation2.isRemovedOnCompletion = false

            // Draw lines
            for i in 0 ..< 5 {
                let line = mageIndicatorShapes.line.layerWith(size: CGSize(width: lineSize, height: animationRect.size.height), color: color ?? self.color)
                let frame = CGRect(x:x + lineSize * 2 * CGFloat(i), y: y, width: lineSize, height: animationRect.size.height)

                animation2.beginTime = beginTime + beginTimes[i]
                line.frame = frame
                line.add(animation2, forKey: "animation")
                layer.addSublayer(line)
            }
            contentView.layer.addSublayer(layer)
        case .circeRoundRound:
                let circleSpacing: CGFloat = -2
                let circleSize = (animationRect.size.width - 4 * circleSpacing) / 5
               // let x = (layer.bounds.size.width - size.width) / 2
              //  let y = (layer.bounds.size.height - size.height) / 2
                
                let duration: CFTimeInterval = 1
                let beginTime = CACurrentMediaTime()
                let beginTimes: [CFTimeInterval] = [0, 0.12, 0.24, 0.36, 0.48, 0.6, 0.72, 0.84]

                // Scale animation
                let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

                scaleAnimation.keyTimes = [0, 0.5, 1]
                scaleAnimation.values = [1, 0.4, 1]
                scaleAnimation.duration = duration

                // Opacity animation
                let opacityAnimaton = CAKeyframeAnimation(keyPath: "opacity")

                opacityAnimaton.keyTimes = [0, 0.5, 1]
                opacityAnimaton.values = [1, 0.3, 1]
                opacityAnimaton.duration = duration

                // Animation
                let animation = CAAnimationGroup()

                animation.animations = [scaleAnimation, opacityAnimaton]
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                animation.duration = duration
                animation.repeatCount = HUGE
                animation.isRemovedOnCompletion = false

                // Draw circles
                for i in 0 ..< 8 {
                    let circle = circleAt(angle: CGFloat(Double.pi / 4) * CGFloat(i),
                                      size: circleSize,
                                      origin: CGPoint(x: x, y: y),
                                      containerSize: animationRect.size,
                                      color: color ?? self.color)

                    animation.beginTime = beginTime + beginTimes[i]
                    circle.add(animation, forKey: "animation")
                    layer.addSublayer(circle)
                }
            contentView.layer.addSublayer(layer)
        case .lineRoundRound:
          
                let lineSpacing: CGFloat = 2
            let lineSize = CGSize(width: (animationRect.size.width - 4 * lineSpacing) / 5, height: (animationRect.size.height - 2 * lineSpacing) / 3)
                //let x = (layer.bounds.size.width - size.width) / 2
             //   let y = (layer.bounds.size.height - size.height) / 2
                let duration: CFTimeInterval = 1.2
                let beginTime = CACurrentMediaTime()
                let beginTimes: [CFTimeInterval] = [0.12, 0.24, 0.36, 0.48, 0.6, 0.72, 0.84, 0.96]
                let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

                // Animation
                let animation = CAKeyframeAnimation(keyPath: "opacity")

                animation.keyTimes = [0, 0.5, 1]
                animation.timingFunctions = [timingFunction, timingFunction]
                animation.values = [1, 0.3, 1]
                animation.duration = duration
                animation.repeatCount = HUGE
                animation.isRemovedOnCompletion = false

                // Draw lines
                for i in 0 ..< 8 {
                    let line = lineAt(angle: CGFloat(Double.pi / 4 * Double(i)),
                                      size: lineSize,
                                      origin: CGPoint(x: x, y: y),
                                      containerSize: animationRect.size,
                                      color: color ?? self.color)

                    animation.beginTime = beginTime + beginTimes[i]
                    line.add(animation, forKey: "animation")
                    layer.addSublayer(line)
                }
            contentView.layer.addSublayer(layer)
          // return self
       case .threeDots:
            let circleSpacing: CGFloat = 2
            let circleSize = (animationRect.size.width - circleSpacing * 2) / 3
          //  let x = (layer.bounds.size.width - animationRect.size.width) / 2
          //  let y = (layer.bounds.size.height - circleSize) / 2
            let duration: CFTimeInterval = 0.7
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0.35, 0, 0.35]

            // Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.values = [1, 0.75, 1]
            scaleAnimation.duration = duration

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.keyTimes = [0, 0.5, 1]
            opacityAnimation.values = [1, 0.2, 1]
            opacityAnimation.duration = duration

            // Aniamtion
            let animation = CAAnimationGroup()
        
            animation.animations = [scaleAnimation, opacityAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circles
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color ?? self.color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                               y: y,
                               width: circleSize,
                               height: circleSize)

            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            }
        contentView.layer.addSublayer(layer)
        case .musicBeat:
            let lineSize = animationRect.size.width / 9
          
                let duration: [CFTimeInterval] = [4.3, 2.5, 1.7, 3.1]
                let values = [0, 0.7, 0.4, 0.05, 0.95, 0.3, 0.9, 0.4, 0.15, 0.18, 0.75, 0.01]

                // Draw lines
                for i in 0 ..< 4 {
                    let animation = CAKeyframeAnimation()

                    animation.keyPath = "path"
                    animation.isAdditive = true
                    animation.values = []

                    for j in 0 ..< values.count {
                        let heightFactor = values[j]
                        let height = animationRect.size.height * CGFloat(heightFactor)
                        let point = CGPoint(x: 0, y: animationRect.size.height - height)
                        let path = UIBezierPath(rect: CGRect(origin: point, size: CGSize(width: lineSize, height: height)))

                        animation.values?.append(path.cgPath)
                    }
                    animation.duration = duration[i]
                    animation.repeatCount = HUGE
                    animation.isRemovedOnCompletion = false

                    let line = mageIndicatorShapes.line.layerWith(size: CGSize(width: lineSize, height: animationRect.size.height), color: color ?? self.color)
                    let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                                       y: y,
                                       width: lineSize,
                                       height: animationRect.size.height)

                    line.frame = frame
                    line.add(animation, forKey: "animation")
                    layer.addSublayer(line)
                }
            contentView.layer.addSublayer(layer)
        case .expandingRing:
                let duration: CFTimeInterval = 1
                let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)

                // Scale animation
                let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

                scaleAnimation.keyTimes = [0, 0.7]
                scaleAnimation.timingFunction = timingFunction
                scaleAnimation.values = [0.1, 1]
                scaleAnimation.duration = duration

                // Opacity animation
                let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

                opacityAnimation.keyTimes = [0, 0.7, 1]
                opacityAnimation.timingFunctions = [timingFunction, timingFunction]
                opacityAnimation.values = [1, 0.7, 0]
                opacityAnimation.duration = duration

                // Animation
                let animation = CAAnimationGroup()

                animation.animations = [scaleAnimation, opacityAnimation]
                animation.duration = duration
                animation.repeatCount = HUGE
                animation.isRemovedOnCompletion = false

                // Draw circle
            let circle = mageIndicatorShapes.ring.layerWith(size: animationRect.size, color: color ?? self.color)
            let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            
            contentView.layer.addSublayer(layer)
        case .multipleRing:
                let duration: CFTimeInterval = 1.25
                let beginTime = CACurrentMediaTime()
                let beginTimes = [0, 0.2, 0.4]
                let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)

                // Scale animation
                let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

                scaleAnimation.keyTimes = [0, 0.7]
                scaleAnimation.timingFunction = timingFunction
                scaleAnimation.values = [0, 1]
                scaleAnimation.duration = duration

                // Opacity animation
                let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

                opacityAnimation.keyTimes = [0, 0.7, 1]
                opacityAnimation.timingFunctions = [timingFunction, timingFunction]
                opacityAnimation.values = [1, 0.7, 0]
                opacityAnimation.duration = duration

                // Animation
                let animation = CAAnimationGroup()

                animation.animations = [scaleAnimation, opacityAnimation]
                animation.duration = duration
                animation.repeatCount = HUGE
                animation.isRemovedOnCompletion = false

                // Draw circles
                for i in 0 ..< 3 {
                    let circle = mageIndicatorShapes.ring.layerWith(size: animationRect.size, color: color ?? self.color)
                    let frame = CGRect(x: x,
                                       y: y,
                                       width: animationRect.size.width,
                                       height: animationRect.size.height)

                    animation.beginTime = beginTime + beginTimes[i]
                    circle.frame = frame
                    circle.add(animation, forKey: "animation")
                    layer.addSublayer(circle)
                }
            contentView.layer.addSublayer(layer)
        case .wifiConnect:
            let duration: CFTimeInterval = 1.25
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0, 0.2, 0.4]
            let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)

            // Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.7]
            scaleAnimation.timingFunction = timingFunction
            scaleAnimation.values = [0, 1]
            scaleAnimation.duration = duration

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.keyTimes = [0, 0.7, 1]
            opacityAnimation.timingFunctions = [timingFunction, timingFunction]
            opacityAnimation.values = [1, 0.7, 0]
            opacityAnimation.duration = duration

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circles
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.ringUp.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
           
            contentView.layer.addSublayer(layer)
        case .waterDrop:
            let duration: CFTimeInterval = 1.25
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0, 0.2, 0.4]
            let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)

            // Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.7]
            scaleAnimation.timingFunction = timingFunction
            scaleAnimation.values = [0, 1]
            scaleAnimation.duration = duration

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.keyTimes = [0, 0.7, 1]
            opacityAnimation.timingFunctions = [timingFunction, timingFunction]
            opacityAnimation.values = [1, 0.7, 0]
            opacityAnimation.duration = duration

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circles
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.ringUp.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.ringDown.layerWith(size: animationRect.size, color: .red )
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            contentView.layer.addSublayer(layer)
        case .singleBubble:
            let duration: CFTimeInterval = 1

            // Scale animation
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

            scaleAnimation.duration = duration
            scaleAnimation.fromValue = 0
            scaleAnimation.toValue = 1

            // Opacity animation
            let opacityAnimation = CABasicAnimation(keyPath: "opacity")

            opacityAnimation.duration = duration
            opacityAnimation.fromValue = 1
            opacityAnimation.toValue = 0

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circle
            let circle = mageIndicatorShapes.circle.layerWith(size: animationRect.size, color: color ?? self.color)

            circle.frame = CGRect(x: x,
                                  y: y,
                                  width: animationRect.size.width,
                                  height: animationRect.size.height)
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .multipleBubble:
            let duration: CFTimeInterval = 1
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0, 0.2, 0.4]

            // Scale animation
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

            scaleAnimation.duration = duration
            scaleAnimation.fromValue = 0
            scaleAnimation.toValue = 1

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.duration = duration
            opacityAnimation.keyTimes = [0, 0.05, 1]
            opacityAnimation.values = [0, 1, 0]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw balls
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circle.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.opacity = 0
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            contentView.layer.addSublayer(layer)
        case .seaWave:
            let duration: CFTimeInterval = 1
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0, 0.2, 0.4]

            // Scale animation
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

            scaleAnimation.duration = duration
            scaleAnimation.fromValue = 0
            scaleAnimation.toValue = 1

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.duration = duration
            opacityAnimation.keyTimes = [0, 0.05, 1]
            opacityAnimation.values = [0, 1, 0]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw balls
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circleUp.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.opacity = 0
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circleDown.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.opacity = 0
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            contentView.layer.addSublayer(layer)
        case .stoneDrop:
            let duration: CFTimeInterval = 1
            let beginTime = CACurrentMediaTime()
            let beginTimes = [0, 0.2, 0.4]

            // Scale animation
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

            scaleAnimation.duration = duration
            scaleAnimation.fromValue = 0
            scaleAnimation.toValue = 1

            // Opacity animation
            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

            opacityAnimation.duration = duration
            opacityAnimation.keyTimes = [0, 0.05, 1]
            opacityAnimation.values = [0, 1, 0]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, opacityAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw balls
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circleUp.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.opacity = 0
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            for i in 0 ..< 3 {
                let circle = mageIndicatorShapes.circleDown.layerWith(size: animationRect.size, color: color ?? self.color)
                let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                animation.beginTime = beginTime + beginTimes[i]
                circle.frame = frame
                circle.opacity = 0
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
            let circle = mageIndicatorShapes.ring.layerWith(size: animationRect.size, color: (secondaryColor ?? color) ?? self.color)
            let frame = CGRect(x: x,
                                   y: y,
                                   width: animationRect.size.width,
                                   height: animationRect.size.height)

                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .rotatingArc:
            let duration: CFTimeInterval = 0.75

            //    Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.values = [1, 0.6, 1]

            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = scaleAnimation.keyTimes
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [ rotateAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circle
            let circle = mageIndicatorShapes.ringThreeFourth.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            let frame = CGRect(x: x,
                               y: y,
                               width: animationRect.size.width,
                               height: animationRect.size.height)

            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .rotatingWheel:
            let duration: CFTimeInterval = 0.75
            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = [0, 0.5, 1]
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [rotateAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circle
            let hline = mageIndicatorShapes.lineToRotate.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            let frame = CGRect(x: x,
                               y: y,
                               width: animationRect.size.width,
                               height: animationRect.size.height)

            hline.frame = frame
            hline.add(animation, forKey: "animation")
            layer.addSublayer(hline)
            let hline2 = mageIndicatorShapes.verticalLine.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            hline2.frame = frame
            hline2.add(animation, forKey: "animation")
            layer.addSublayer(hline2)
            let circle=mageIndicatorShapes.ring.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            circle.frame=frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .rotatingWheelWithScale:
            let duration: CFTimeInterval = 0.75

            //    Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.values = [1, 0.6, 1]

            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = scaleAnimation.keyTimes
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [ scaleAnimation,rotateAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circle
            let hline = mageIndicatorShapes.lineToRotate.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            let frame = CGRect(x: x,
                               y: y,
                               width: animationRect.size.width,
                               height: animationRect.size.height)

            hline.frame = frame
            hline.add(animation, forKey: "animation")
            layer.addSublayer(hline)
            let hline2 = mageIndicatorShapes.verticalLine.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            hline2.frame = frame
            hline2.add(animation, forKey: "animation")
            layer.addSublayer(hline2)
            let circle=mageIndicatorShapes.ring.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            circle.frame=frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .rotatingSemiArcWithball:
            let duration: CFTimeInterval = 0.75

            //    Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.values = [1, 0.6, 1]

            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = scaleAnimation.keyTimes
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, rotateAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw upArc
            let upArc = mageIndicatorShapes.ringUp.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            let frame = CGRect(x: x,
                               y: y,
                               width: animationRect.size.width,
                               height: animationRect.size.height)
            upArc.frame = frame
            upArc.add(animation, forKey: "animation")
            layer.addSublayer(upArc)
            //draw downArc
            let downArc = mageIndicatorShapes.ringDown.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            downArc.frame = frame
            downArc.add(animation, forKey: "animation")
            layer.addSublayer(downArc)
            //draw circle
            let circle=mageIndicatorShapes.circle.layerWith(size: CGSize(width: animationRect.size.width/2, height: animationRect.size.height/2), color: (secondaryColor ?? color) ?? self.color)
            let frame2 = CGRect(x: x+animationRect.size.width/4,
                               y: y+animationRect.size.height/4,
                               width: animationRect.size.width/2,
                               height: animationRect.size.height/2)
            circle.frame=frame2
            circle.add(animation,forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        case .rotatingArcwithArc:
            let duration: CFTimeInterval = 0.75

            //    Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.values = [1, 0.6, 1]

            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = scaleAnimation.keyTimes
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]

            // Animation
            let animation = CAAnimationGroup()
            animation.animations = [scaleAnimation, rotateAnimation]
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            let upArc = mageIndicatorShapes.ringUp.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            let frame = CGRect(x: x,
                               y: y,
                               width: animationRect.size.width,
                               height: animationRect.size.height)

            upArc.frame = frame
            upArc.add(animation, forKey: "animation")
            layer.addSublayer(upArc)
            let downArc = mageIndicatorShapes.ringDown.layerWith(size: CGSize(width: animationRect.size.width, height: animationRect.size.height), color: color ?? self.color)
            downArc.frame = frame
            downArc.add(animation, forKey: "animation")
            layer.addSublayer(downArc)
            let right = mageIndicatorShapes.ringRight.layerWith(size: CGSize(width: animationRect.size.width/2, height: animationRect.size.height/2), color: color ?? self.color)
            let frame2 = CGRect(x: x+animationRect.size.width/4,
                                                                                                                                                                                             y: y+animationRect.size.height/4,
                                                                                                                                                                                             width: animationRect.size.width/2,
                                                                                                                                                                                             height:
                                                                                                                                                                    animationRect.size.height/2)
            right.frame = frame2
            right.add(animation, forKey: "animation")
            layer.addSublayer(right)
            let left = mageIndicatorShapes.ringLeft.layerWith(size: CGSize(width: animationRect.size.width/2, height: animationRect.size.height/2), color: color ?? self.color)
            
            left.frame = frame2
            left.add(animation, forKey: "animation")
            layer.addSublayer(left)
            
            contentView.layer.addSublayer(layer)
        case .rotatingBalls:
            let circleSize: CGFloat = animationRect.size.width / 5
            let duration: CFTimeInterval = 1
            let timingFunction = CAMediaTimingFunction(controlPoints: 0.7, -0.13, 0.22, 0.86)

            // Scale animation
            let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

            scaleAnimation.keyTimes = [0, 0.5, 1]
            scaleAnimation.timingFunctions = [timingFunction, timingFunction]
            scaleAnimation.values = [1, 0.6, 1]
            scaleAnimation.duration = duration

            // Rotate animation
            let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

            rotateAnimation.keyTimes = [0, 0.5, 1]
            rotateAnimation.timingFunctions = [timingFunction, timingFunction]
            rotateAnimation.values = [0, Double.pi, 2 * Double.pi]
            rotateAnimation.duration = duration

            // Animation
            let animation = CAAnimationGroup()

            animation.animations = [scaleAnimation, rotateAnimation]
            animation.duration = duration
            animation.repeatCount = HUGE
            animation.isRemovedOnCompletion = false

            // Draw circles
            let leftCircle = mageIndicatorShapes.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color ?? self.color)
            let rightCircle = mageIndicatorShapes.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color ?? self.color)
            let centerCircle = mageIndicatorShapes.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color ?? self.color)

            leftCircle.opacity = 0.6
            leftCircle.frame = CGRect(x: 0, y: (animationRect.size.height - circleSize) / 2, width: circleSize, height: circleSize)
            rightCircle.opacity = 0.6
            rightCircle.frame = CGRect(x: animationRect.size.width - circleSize, y: (animationRect.size.height - circleSize) / 2, width: circleSize, height: circleSize)
            centerCircle.frame = CGRect(x: (animationRect.size.width - circleSize) / 2, y: (animationRect.size.height - circleSize) / 2, width: circleSize, height: circleSize)

            let circle = CALayer()
            let frame = CGRect(x: x, y: y, width: animationRect.size.width, height: animationRect.size.height)

            circle.frame = frame
            circle.addSublayer(leftCircle)
            circle.addSublayer(rightCircle)
            circle.addSublayer(centerCircle)
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
            contentView.layer.addSublayer(layer)
        }
        
    }
    func circleAt(angle: CGFloat, size: CGFloat, origin: CGPoint, containerSize: CGSize, color: UIColor) -> CALayer {
        let radius = containerSize.width / 2 - size / 2
        let circle = mageIndicatorShapes.circle.layerWith(size: CGSize(width: size, height: size), color: color)
        let frame = CGRect(
            x: origin.x + radius * (cos(angle) + 1),
            y: origin.y + radius * (sin(angle) + 1),
            width: size,
            height: size)

        circle.frame = frame

        return circle
    }
    func lineAt(angle: CGFloat, size: CGSize, origin: CGPoint, containerSize: CGSize, color: UIColor) -> CALayer {
        let radius = containerSize.width / 2 - max(size.width, size.height) / 2
        let lineContainerSize = CGSize(width: max(size.width, size.height), height: max(size.width, size.height))
        let lineContainer = CALayer()
        let lineContainerFrame = CGRect(
            x: origin.x + radius * (cos(angle) + 1),
            y: origin.y + radius * (sin(angle) + 1),
            width: lineContainerSize.width,
            height: lineContainerSize.height)
        let line = mageIndicatorShapes.line.layerWith(size: size, color: color)
        let lineFrame = CGRect(
            x: (lineContainerSize.width - size.width) / 2,
            y: (lineContainerSize.height - size.height) / 2,
            width: size.width,
            height: size.height)

        lineContainer.frame = lineContainerFrame
        line.frame = lineFrame
        lineContainer.addSublayer(line)
        lineContainer.sublayerTransform = CATransform3DMakeRotation(CGFloat(Double.pi / 2) + angle, 0, 0, 1)
        return lineContainer
    }
}
