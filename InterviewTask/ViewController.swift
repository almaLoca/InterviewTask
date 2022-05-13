//
//  ViewController.swift
//  InterviewTask
//
//  Created by Reshma on 13/03/21.
//

import UIKit

class ViewController: UIViewController {
    let apiManager = ApiManager()
    var mediaArray = [MediaModel]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configMediaCell()
        callMediaApi()
    }
    func configMediaCell() {
        tableView.register(UINib(nibName: MediaCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: MediaCell.cellIdentifier)
    }
    
    func callMediaApi() {
        apiManager.getRequest { (mediaModels, status) in
            if status{
                if let media = mediaModels
                {
                    if media.count > 0 {
                        self.mediaArray = media
                        self.tableView.reloadData()
                    }
                }
            }
            else{
                print("Error")
            }
            
        }
    }

}

// MARK: - TABLEVIEW DELEGATE
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  mediaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MediaCell.cellIdentifier) as! MediaCell
        let media = mediaArray[indexPath.row]
        cell.setupCell(with: media)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController.create()
        controller.mediaModel = mediaArray[indexPath.row]
         self.navigationController?.pushViewController(controller, animated: true)

       
    }
}

