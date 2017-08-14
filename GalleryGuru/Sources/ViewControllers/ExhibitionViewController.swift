//
//  ExhibitionViewController.swift
//  GalleryGuru
//
//  Created by Yaroslav Surovtsev on 8/12/17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class ExhibitionViewController: UIViewController {

    @IBOutlet weak var exhibitionListTableView: UITableView!
    
    var exhibitions: [Exhibition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateLoginViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configurateLoginViewController() {
        let identifier = ExhibitionCell.identifier
        exhibitionListTableView.register(UINib(nibName: identifier, bundle: nil),
                                         forCellReuseIdentifier: identifier)
        exhibitionListTableView.dataSource = self
    }

}

extension ExhibitionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionCell.identifier)!
        ExhibitionCellConfigurator().configure(with: cell as! ConfigurableCell,
                               model: exhibitions[indexPath.row])
        return cell
    }

}


