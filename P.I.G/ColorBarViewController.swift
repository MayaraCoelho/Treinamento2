//
//  ColorBarViewController.swift
//  ColorBar
//
//  Created by Henrique do Prado Linhares on 23/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class ColorBarViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!

    @IBOutlet weak var greenViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redViewWidthConstraint: NSLayoutConstraint!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bounds = CGRectMake(0, 0, 300, 60)
        self.greenViewWidthConstraint.constant = CGFloat(0)
        self.redViewWidthConstraint.constant = CGFloat(0)
        
        // Do any additional setup after loading the view.
       
    }
    


    
    func drawBar(pNumber:Int){
        var number = (pNumber*150)/100
        if (number > 0){
            self.greenViewWidthConstraint.constant = CGFloat(number)
            self.redViewWidthConstraint.constant = CGFloat(0)
        } else if (number < 0){
            number = number * -1
            self.redViewWidthConstraint.constant = CGFloat(number)
            self.greenViewWidthConstraint.constant = CGFloat(0)
        } else{
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
