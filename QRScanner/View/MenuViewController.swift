import UIKit

class MenuViewController: UIViewController {
    
    var products = [Product]()
    var catalogProducts = Products.hamburgersList
    
    private let tableView: UITableView = {
        let tabelView = UITableView()
        tabelView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.menuCellID)
        return tabelView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.menuCellID, for: indexPath) as! MenuTableViewCell
        cell.product = catalogProducts[indexPath.row]
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
