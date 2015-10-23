//
//  ColorBarViewController.swift
//  ColorBar
//
//  Created by Henrique do Prado Linhares on 23/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class ColorBarViewController: UIViewController {
    

    @IBOutlet weak var greenViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var middleBarView: UIView!

    @IBOutlet weak var textLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.bounds = CGRectMake(0, 0, 200, 28)
        self.greenViewWidthConstraint.constant = CGFloat(0)
        self.redViewWidthConstraint.constant = CGFloat(0)
        self.middleBarView.hidden = true
        // Do any additional setup after loading the view.
       
    }
    


    
    func drawBar(pNumber:Float){
        if (pNumber > 1){ // Green Value
            if (pNumber >= 2){
            self.greenViewWidthConstraint.constant = CGFloat(100)
            } else {
                self.greenViewWidthConstraint.constant = CGFloat(((pNumber-1)*100))
            }
            self.redViewWidthConstraint.constant = CGFloat(0)
            
        } else if (pNumber < 1){ // Red Value
            self.greenViewWidthConstraint.constant = CGFloat(0)
            self.redViewWidthConstraint.constant = CGFloat(pNumber * 100)
            
            
        }else { // None
            self.greenViewWidthConstraint.constant = CGFloat(0)
            self.redViewWidthConstraint.constant = CGFloat(0)
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
