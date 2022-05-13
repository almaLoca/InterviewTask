//
//  ApiManager.swift
//  InterviewTask
//
//  Created by Reshma on 14/03/21.
//

import UIKit
import Alamofire


class ApiManager: NSObject {
        
    static let URL_GETMEDIA:String =  "https://interview-e18de.firebaseio.com/media.json?print=pretty"

    func getRequest(params : Parameters = [:], completionHandler: @escaping ([MediaModel]?, Bool) -> Void)-> Void {
        
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]

        AF.request(ApiManager.URL_GETMEDIA, headers: headers).responseJSON{ response in
            switch response.result {
            case .success:
                            if let data = response.data {
                                do {
                                    let response = try JSONDecoder().decode([MediaModel].self, from: data)
                                    completionHandler(response, true)
                                }
                                catch {
                                    print(error.localizedDescription)
                                }
                            }
//                    case .success:
//                        print(response.value!)
//                        if let JSON = response.value {
//                            print(JSON)
//                            debugPrint("✅ Respons Object >>>> " + String(describing: JSON))
//                            let decoder = JSONDecoder()
//                            do {
//                                let mediaModel = try decoder.decode(MediaModel.self, from: response.data!)
//                                completionHandler(mediaModel, true)
//                            } catch {
//                                print(error.localizedDescription)
//                                completionHandler(nil, false)
//                            }
//                        }
                    case .failure(let error):
                        print(error)
                        completionHandler(nil, false)
                    }
            }
        }

}
