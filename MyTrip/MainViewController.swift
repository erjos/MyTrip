import UIKit
import Foundation

class MainViewController: UIViewController {

    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //hide the navigation bar
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.handleMenuTap(_:)))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewHeight.constant = 0
        setupTapGesture()
        setupCloseMenuTapGesture()
        setupTripListTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupTripListTable(){
        let tripListVC = TripListViewController()
        self.addChildViewController(tripListVC)
        tripListVC.view.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
        contentContainer.addSubview(tripListVC.view)
        tripListVC.view.frame = contentContainer.bounds
        tripListVC.didMove(toParentViewController: self)
    }
    
    func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleMenuTap(_:)))
        tap.delegate = self
        menuIcon.addGestureRecognizer(tap)
    }
    
    func setupCloseMenuTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseMenuTap(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    func collapseMenu(){
        if(tableViewHeight.constant != 0){
            tableViewHeight.constant = 0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut
            , animations: {
                self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func handleCloseMenuTap(_ sender: UITapGestureRecognizer){
        collapseMenu()
    }
    
    func handleMenuTap(_ sender: UITapGestureRecognizer){
        if(tableViewHeight.constant == 0){
            tableViewHeight.constant = 91
        }else{
            collapseMenu()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut
            , animations: {
                self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

//may not need to make this a delegate...
extension MainViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}

extension MainViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var text : String
        if(indexPath.row == 0){
          text = "New Trip"
        } else {
            text = "Settings"
        }
        cell.backgroundColor = UIColor(red: 90/255, green: 90/255, blue: 255/255, alpha: 50/255)
        cell.textLabel?.text = text
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
}
