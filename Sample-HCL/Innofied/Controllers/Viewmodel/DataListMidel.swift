//
//  DataListMidel.swift
//  //  SampleProject
//
//    Created by Ashok on 17/06/24.
//

import Foundation
class DataListModel : NSObject{
    
    var dataLiatViewModelObj = [DataListViewModel]()
    func getUserDetail(complition: @escaping(Bool)->Void){
        let urlTest = URL(string: "https://www.jsonkeeper.com/b/6JS0")
        
        var request = URLRequest(url: urlTest!)
        
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task : URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 200{
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                        print(jsonResult)
                        if let dict =  jsonResult["hits"] as? NSArray{
                            for individualData in  dict {
                                let object =  DataListViewModel.init(dataObj: individualData as! [String : Any])
                                self.dataLiatViewModelObj.append(object)
                            }; complition(true)
                        }
                    }
                }                    catch {
                    print("Could not convert JSON data into a dictionary.")
                }
                
            }
           
            
        }; task.resume()
        
        
    }
    
}
