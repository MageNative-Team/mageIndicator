# mageIndicator
An activity indicator which makes your navigation and processing look cool

-> There are 2 functions available

 1.  addAnimationView(in: UIView  , frame: CGRect , color: UIColor? , secondaryColor: UIColor? , types: activityAnimatorTypes)
 2.  stopAnimation(in: UIView)

# AddAnimation
 Parameters:-
 
    1. UIView : The View in which you want to add indicator.
    2. Frame : The frame in which indicator will appear.
    3. color : An optional primary color of indicator. In case you provide nil , it will take white as default color
    4. secondaryColor : An optional secondary color which is applicable only for certain indicators. If you provide it as nil, it will take primary color and in case if primary color is also nil, it will take white.
    5. types : And finally , the type of indicator. We've provided 20 indicators. In future it will be updated.

# How To Use

Its quite simple.

    1. Create an instance of class mageIndicator() . Make sure its mageIndicator type.
    2. To add indicator use addAnimationView method .
    3. to stop animation use stopAnimatioin method.
    
    Example: 
    
    import UIKit
    import mageIndicator
    class ViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            let indicator=mageIndicator()
            indicator.addAnimationView( in: self.view, frame: CGRect(x: UIScreen.main.bounds.width/2-25, y: UIScreen.main.bounds.height/2-25, width: 50 , height: 50), color: .darkGray, secondaryColor: .red, types: .rotatingSemiArcWithball )
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                indicator.stopAnimation(in: self.view)
            }
        }
    }


