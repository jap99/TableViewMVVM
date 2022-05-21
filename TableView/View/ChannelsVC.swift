// Copyright 2022: Javid A. Poornasir

import UIKit
import Algorithms

final class ChannelsVC: UIViewController {
    
    private var channelsList: ChannelsList?
    var vm: ChannelsVM?
    
    private let tv: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChannelCell.self, forCellReuseIdentifier:CellID.channel.rawValue)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVM()
        self.setupTV()
    }
     
}


extension ChannelsVC {
     
    private func setupVM() {
        if self.vm == nil {
            self.vm = ChannelsVM(self)
        }
    }
    
    private func setupTV() {
        self.tv.backgroundColor = .black
        self.tv.delegate = self
        self.tv.dataSource = self
        self.view.addSubview(self.tv)
        NSLayoutConstraint.activate([
            self.tv.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tv.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.tv.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.tv.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ChannelsVC: ChannelsVCProtocol {}

extension ChannelsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
}

extension ChannelsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemsCount = self.vm?.numberOfItemsInSection() else {
            return 0
        }
        return itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let channelCell = tableView.dequeueReusableCell(withIdentifier:CellID.channel.rawValue, for: indexPath) as? ChannelCell,
              let cellVM = self.vm?.cellViewModelAt(indexPath) else {
            return UITableViewCell()
        }
        channelCell.vm = cellVM
        cellVM.setView(channelCell)
        channelCell.configureCell()
        return channelCell
    }
    
    
}
