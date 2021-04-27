//
//  ViewController.swift
//  mageIndicatorExample
//
//  Created by cedcoss on 27/04/21.
//

import UIKit
import mageIndicator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let indicator=mageIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            indicator.addAnimationView( in: self.view, frame: CGRect(x: UIScreen.main.bounds.width/2-25, y: UIScreen.main.bounds.height/2-25, width: 50 , height: 50), color: .darkGray, secondaryColor: nil, types: .rotatingSemiArcWithball )
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                indicator.stopAnimation(in: self.view)
            }
        }
    }


}

