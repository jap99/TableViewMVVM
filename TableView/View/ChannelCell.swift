// Copyright 2022: Javid A. Poornasir

import UIKit

final class ChannelCell: UITableViewCell, ChannelsVCCellProtocol {
    
    var vm: ChannelCellVM?
    private var channelImageURL: String = "https://mobile-interview.s3.amazonaws.com/"
    private let insets = UIEdgeInsets(top:20, left:10, bottom:20, right:10)
    
    private lazy var bgView: UIView = {
        let f = CGRect(x:10, y:6, width:self.frame.width-20, height:120)
        let view = UIView(frame:f)
        view.layer.backgroundColor = UIColor.black.cgColor
        return view
    }()
    
    private lazy var channelImage: UIImageView = {
        let img: UIImageView = DrawCircles(frame: CGRect(x:7, y:7, width:104, height: 104))
        img.image = nil
        img.layer.setBorder()
        img.layer.backgroundColor = UIColor.lightGray.cgColor
        return img
    }()
    
    private lazy var namelbl: UILabel = {
        let f = CGRect(x:126, y:8, width:self.bgView.frame.width-116, height:30)
        let lbl = UILabel(frame:f)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    private lazy var id: UILabel = {
        let f = CGRect(x:126, y:42, width:self.bgView.frame.width-116, height:30)
        let lbl = UILabel(frame:f)
        lbl.textColor = .white
        lbl.textAlignment = .left
        return lbl
    }()
     
    
    
    // MARK: - ACTIONS
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        DispatchQueue.main.async {
            self.addSubview(self.bgView)
            self.bgView.addSubview(self.channelImage)
            self.bgView.addSubview(self.namelbl)
            self.bgView.addSubview(self.id)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.bgView.clipsToBounds = true
            self.channelImage.clipsToBounds = true
            self.channelImage.layer.cornerRadius = 52
            self.bgView.layer.cornerRadius = 5
        }
    }
    
    
    // MARK: - SETUP
    
    func configureCell() {                 // invoked by ChannelsVC's cellForRowAt
        self.vm?.setupCell()
    }
    
    
    // MARK: - CHANNEL_VC_CELL_PROTOCOL
     
    func updateImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.channelImage.image = image
        }
    }
    
    func setCellUIObject(_ id: String, _ name: String) {
        DispatchQueue.main.async {
            self.namelbl.text = name
            self.id.text = id
        }
    }
    
     
 
    
    
    
}




