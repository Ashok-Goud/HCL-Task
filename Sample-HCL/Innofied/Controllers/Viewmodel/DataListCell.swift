//
//  DataListCell.swift
//  Innofied
//
//    Created by Ashok on 17/06/24.
//

import UIKit

class DataListCell: UITableViewCell {

    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(cellData :DataListViewModel){
        self.firstName.text =  String(cellData.id)
        self.lastName.text =  cellData.type
        self.email.text =  cellData.tags
        setServiceImg(imageUrl: cellData.imageURl)
    }
//    func setData(cellData :DataListViewModel){
//        self.firstName.text =  cellData.first_name
//        self.lastName.text =  cellData.last_name
//        self.email.text =  cellData.email
//        setServiceImg(imageUrl: cellData.imageURl)
//    }
    
    func setServiceImg(imageUrl: String) {
        if imageUrl != ""{
            let url = URL(string: imageUrl)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        self.listImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}


