//
//  DataListVc.swift
//  Innofied
//
//   Created by Ashok on 17/06/24.
//

import UIKit

class DataListVc: UIViewController {

    let refreshControl = UIRefreshControl()
    @IBOutlet weak var spinnerView: UIView!{
      didSet {
        spinnerView.layer.cornerRadius = 6
      }
    }
    fileprivate(set) var isSaturated = false
    fileprivate(set) var didFail = false
    fileprivate var isLoading = false
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainTableview: UITableView!
    let dataListModel =   DataListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
           mainTableview.addSubview(refreshControl)
      
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        apiCallServicre()
    }
    @objc func refresh(_ sender: AnyObject) {
        dataListModel.dataLiatViewModelObj = []
        DispatchQueue.main.async {
            self.mainTableview.reloadData()
        }
        apiCallServicre()
    }
    
    func apiCallServicre(){
        showSpinner()
        dataListModel.getUserDetail { boolValue in
            testGetUserDetail()
            if boolValue{
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.refreshControl.endRefreshing()
                    self.mainTableview.reloadData()
                }
            }
        }
    }
   
    private func showSpinner() {
        activityIndicator.startAnimating()
        spinnerView.isHidden = false
    }

    private func hideSpinner() {
        activityIndicator.stopAnimating()
        spinnerView.isHidden = true
    }
}
extension DataListVc :UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataListModel.dataLiatViewModelObj.count > 0 {
            return dataListModel.dataLiatViewModelObj.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataListCell", for: indexPath) as! DataListCell
        cell.setData(cellData: dataListModel.dataLiatViewModelObj[indexPath.row])
        return cell
    }
    
    
}

