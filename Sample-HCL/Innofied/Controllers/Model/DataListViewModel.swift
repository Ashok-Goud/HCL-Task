//
//  DataListViewModel.swift
//  Innofied
//
//  Created by Ashok on 18/11/21.
//

import Foundation
class DataListViewModel {
    
    var tags: String = ""
    var type: String = ""
    var  id : Int = 0
    var imageURl:String = ""
    
    init(dataObj: [String:Any]) {
        
        if let tags =  dataObj["tags"]  as? String{
            self.tags =  tags
        }
        
        if let type =  dataObj["type"]  as? String{
            self.type =  type
        }
        
        if let idValue =  dataObj["id"]  as? Int{
            id =  idValue
        }
        if let image =  dataObj["previewURL"]  as? String{
            imageURl =  image
        }
        
    }

}
