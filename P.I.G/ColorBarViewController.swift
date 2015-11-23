//
//  ColorBarViewController.swift
//  ColorBar
//
//  Created by Henrique do Prado Linhares on 23/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class ColorBarViewController: UIViewController {
    

    @IBOutlet weak var barView: UIView!

    @IBOutlet weak var viewWitdhConstraint: NSLayoutConstraint!

    @IBOutlet weak var textLabel: UILabel!
    
    let myGreenColor = UIColor(red: 97/255.0, green: 178/255.0, blue: 47/255.0, alpha: 1.0)
    let myRedColor = UIColor(red: 207/255.0, green: 93/255.0, blue: 93/255.0, alpha: 1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWitdhConstraint.constant = CGFloat(0)
        // Do any additional setup after loading the view.
    }
    
    func drawBar(pNumber:Float){
        if (pNumber > 1){
            barView.backgroundColor = myGreenColor
            if (pNumber >= 2){
                self.viewWitdhConstraint.constant = CGFloat(200)
            } else {
                self.viewWitdhConstraint.constant = CGFloat((pNumber - 1) * 200)
            }
        } else if (pNumber < 1){
            let inversepNumber = 1 - pNumber
            barView.backgroundColor = myRedColor
            self.viewWitdhConstraint.constant = CGFloat((inversepNumber * 200))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
