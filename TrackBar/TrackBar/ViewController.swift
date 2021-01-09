//
//  ViewController.swift
//  TrackBar
//
//  Created by Elattar on 12/12/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit


extension UIView {
    
    func animate(mainColor: UIColor, subColor:UIColor, duration: CFTimeInterval) {
        let layer = CAGradientLayer()
        let startLocations = [0, 0]
        let endLocations = [1, 2]
        
        layer.colors = [mainColor.cgColor, subColor.cgColor]
        layer.frame = self.bounds
        layer.locations = startLocations as [NSNumber]
        layer.startPoint = CGPoint(x: 0.0, y: 1.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.addSublayer(layer)
        
        let anim = CABasicAnimation(keyPath: "locations")
        anim.fromValue = startLocations
        anim.toValue = endLocations
        anim.duration = duration
        layer.add(anim, forKey: "loc")
        layer.locations = endLocations as [NSNumber]
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var progress1_iv: UIImageView!
    @IBOutlet weak var progress2_iv: UIImageView!
    @IBOutlet weak var progress3_iv: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var action_btn: UIButton!
    
    
    let garyColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
    let blueColor = UIColor(red: 26/255, green: 156/255, blue: 252/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func action_btn(_ sender: UIButton) {
        if sender.tag == 1 {
            
            view1.animate(mainColor: blueColor, subColor: garyColor, duration: 1)
            
            self.progress1_iv.image = #imageLiteral(resourceName: "3")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.progress2_iv.image = #imageLiteral(resourceName: "2")
            }
            
            self.progress3_iv.image = #imageLiteral(resourceName: "1")
            
            
        }else if sender.tag == 2 {
            
            view2.animate(mainColor: blueColor, subColor: garyColor, duration: 1)
            
            progress1_iv.image = #imageLiteral(resourceName: "3")
            progress2_iv.image = #imageLiteral(resourceName: "3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.progress3_iv.image = #imageLiteral(resourceName: "2")
            }
            
        }else {
            progress1_iv.image = #imageLiteral(resourceName: "3")
            progress2_iv.image = #imageLiteral(resourceName: "3")
            progress3_iv.image = #imageLiteral(resourceName: "3")
            
        }
        
    }
    
}

