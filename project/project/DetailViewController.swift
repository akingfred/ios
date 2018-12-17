//
//  DetailViewController.swift
//  project
//
//  Created by comsoft on 2018. 12. 3..
//  Copyright © 2018년 comsoft. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var viewCnt: UILabel!
    @IBOutlet var followCnt: UILabel!
    @IBOutlet var imageView: UIImageView!
    var _imageName : String?
    var _follow : String?
    var _view : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = _imageName {
            imageView.image = UIImage(named: text)
        }
        if let text = _follow {
            followCnt.text = text
        }
        if let text = _view {
            viewCnt.text = text
        }
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
