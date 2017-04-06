//
//  CardsViewController.swift
//  TinderLab
//
//  Created by Lum Situ on 4/5/17.
//  Copyright © 2017 Lum Situ. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    var cardInitialCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanImage(_:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
//        let location = sender.location(in: view)
//        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = img.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            
            img.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            
            let rightAngle = 90 + self.img.center.x / self.cardInitialCenter.x * -70
            let leftAngle = 90 + self.img.center.x / self.cardInitialCenter.x * -110
            
            print("right: \(rightAngle)")
            print("left: \(leftAngle)")
            
            if translation.x > 0 {
                UIView.animate(withDuration: 1.5, animations: {
                    self.img.transform = CGAffineTransform(rotationAngle: CGFloat((rightAngle * CGFloat(Double.pi) / 180)))
                    if translation.x > 50 {
                        self.img.isHidden = true
                    }
                })
                
                
                
            } else if translation.x < 0 {
                UIView.animate(withDuration: 1.5, animations: {
                    self.img.transform = CGAffineTransform(rotationAngle: CGFloat((leftAngle * CGFloat(Double.pi) / 180)))
                    if translation.x < -50 {
                        self.img.isHidden = true
                    }
                })
                
            }
            //                    self.img.transform = CGAffineTransform(rotationAngle: CGFloat((angle * CGFloat(M_PI) / 180)))
            
            
//            if translation.x > 0 {
//                UIView.animate(withDuration: 0.2, animations: { 
//                    //self.dismiss(animated: true, completion: nil)
//                    print("Done right")
//                    let angle = 90 + self.img.center.x / self.cardInitialCenter.x * -70
//                    self.img.transform = CGAffineTransform(rotationAngle: CGFloat((angle * CGFloat(M_PI) / 180)))
//                })
//                
//                
//            } else if translation.x < 0 {
//                img.transform = CGAffineTransform(rotationAngle: CGFloat((location.x / 12)))
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.dismiss(animated: true, completion: nil)
//                    print("Done left")
//                })
////                img.transform = CGAffineTransform(rotationAngle: CGFloat((location.x)))
//            } else {
//                img.transform = CGAffineTransform(rotationAngle: CGFloat((location.x / 8)))
//                img.transform = CGAffineTransform.identity
//            }
            
        } else if sender.state == .ended {
            print("Gesture ended")
            img.center = cardInitialCenter
            img.transform = CGAffineTransform.identity
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
