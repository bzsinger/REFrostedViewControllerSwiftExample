//
//  MenuViewController.swift
//  REFrostedViewControllerSwiftExample
//
//  Created by Benny Singer on 5/20/17.
//  Copyright © 2017 Benny Singer. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(colorLiteralRed: 150/255.0, green: 161/255.0, blue: 177/255.0, alpha: 1.0)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isOpaque = false
        self.tableView.backgroundColor = .clear
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 184.0))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 40, width: 100, height: 100))
        imageView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin]
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3.0
        imageView.layer.rasterizationScale = UIScreen.main.scale
        imageView.layer.shouldRasterize = true
        imageView.clipsToBounds = true
        
        let label = UILabel(frame: CGRect(x: 0.0, y: 150.0, width: 0.0, height: 24.0))
        label.text = "Roman Efimov"
        label.font = UIFont(name: "HelveticaNeue", size: 21.0)
        label.backgroundColor = .clear
        label.textColor = UIColor(colorLiteralRed: 62/255.0, green: 68/255.0, blue: 75/255.0, alpha: 1.0)
        label.sizeToFit()
        label.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin]
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        self.tableView.tableHeaderView = view
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor(colorLiteralRed: 62/255.0, green: 68/255.0, blue: 75/255.0, alpha: 1.0)
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 17.0)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return nil
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 24))
        view.backgroundColor = UIColor(colorLiteralRed: 167/255.0, green: 167/255.0, blue: 167/255.0, alpha: 0.6)
        
        let label = UILabel(frame: CGRect(x: 10, y: 8, width: 0, height: 0))
        label.text = "Friends Online"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = .white
        label.sizeToFit()
        
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 0
        }
        
        return 34
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "contentController") as! NavigationController
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "homeController")
            navigationController.viewControllers = [homeViewController!]
        } else {
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondController")
            navigationController.viewControllers = [secondViewController!]
        }
        
        self.frostedViewController.contentViewController = navigationController
        self.frostedViewController.hideMenuViewController()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if indexPath.section == 0 {
            let titles = ["Home", "Profile", "Chats"]
            cell?.textLabel?.text = titles[indexPath.row]
        } else {
            let titles = ["John Appleseed", "John Doe", "Test User"]
            cell?.textLabel?.text = titles[indexPath.row]
        }
        
        return cell!
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
