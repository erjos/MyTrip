//
//  FinishViewController.swift
//  MyTrip
//
//  Created by Joseph, Ethan on 5/20/17.
//  Copyright © 2017 Joseph, Ethan. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreData

class FinishViewController: UIViewController {
    
    var name: String?
    var placeName: String?

    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBAction func startPlanning(_ sender: Any) {
        self.saveTrip(name!, placeName!)
        performSegue(withIdentifier: "FinishToTrip", sender: self)
    }
    
    //Save trip to core data - will fetch on the next page
    func saveTrip(_ name: String, _ placeName: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Trip", in: managedContext)!
        
        let trip = NSManagedObject(entity: entity, insertInto: managedContext)
        
        trip.setValue(name, forKey: "name")
        trip.setValue(placeName, forKey: "placeName")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? MyTripViewController
        controller?.name = self.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tripName.text = name
        location.text = placeName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
