//
//  RootViewController.swift
//  REFrostedViewControllerSwiftExample
//
//  Created by Benny Singer on 5/20/17.
//  Copyright © 2017 Benny Singer. All rights reserved.
//

import UIKit
import REFrostedViewController

class RootViewController: REFrostedViewController {
    
    override func awakeFromNib() {
        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "contentController")
        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "menuController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
