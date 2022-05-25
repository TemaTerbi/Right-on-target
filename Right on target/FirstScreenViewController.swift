//
//  FirstScreenViewController.swift
//  Right on target
//
//  Created by TeRb1 on 25.05.2022.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        
        versionLabel.text = "Версия 1.3"
        
        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextScreen(sender: UIButton) {
        
        var inditifier: String
        
        if sender.titleLabel?.text == "Число" {
            inditifier = "NumberVIew"
        } else {
            inditifier = "ColorView"
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: inditifier)
        
        self.present(viewController, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
