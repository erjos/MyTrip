import UIKit

class TripListViewController: UIViewController {

    @IBOutlet weak var tripListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TripListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //will return number of trips
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension TripListViewController: UITableViewDelegate{
    
}
