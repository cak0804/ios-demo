//
//  lastcontroller.swift
//  7-29-project-controller
//
//  Created by bytedance on 7/29/20.
//

import UIKit

class lastcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 300, y: 200, width: 200, height: 100))
        label.text = "heiehi"
        view.addSubview(label)
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
