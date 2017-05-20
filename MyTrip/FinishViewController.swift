//
//  FinishViewController.swift
//  MyTrip
//
//  Created by Joseph, Ethan on 5/20/17.
//  Copyright © 2017 Joseph, Ethan. All rights reserved.
//

import UIKit
import GooglePlaces

class FinishViewController: UIViewController {
    
    var name: String?
    var placeName: String?

    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tripName.text = name
        location.text = placeName
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
