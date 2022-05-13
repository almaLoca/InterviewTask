//
//  DetailViewController.swift
//  InterviewTask
//
//  Created by Reshma on 14/03/21.
//

import UIKit
import Kingfisher
import AVKit


class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var mediaModel : MediaModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeUI()
    }

    static func create()->DetailViewController {
         let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
         return controller
     }
    func initializeUI() {
        var urlString = ""
        if mediaModel.thumb.contains("https") {
            urlString = mediaModel.thumb.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        else{
            urlString = mediaModel.thumb.replacingOccurrences(of: "http", with: "https").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        let url = URL(string: String(urlString))
        imageView.kf.setImage(with: url)
    }

    @IBAction func playAction(_ sender: Any) {
        var urlString = ""

        if mediaModel.thumb.contains("https") {
            urlString = mediaModel.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        else{
            urlString = mediaModel.url.replacingOccurrences(of: "http", with: "https").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        if let videoURL = URL(string: String(urlString)){
            let player = AVPlayer(url: videoURL)
            let vc = AVPlayerViewController()
            vc.player = player

            present(vc, animated: true) {
                vc.player?.play()
            }
        }
            
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
