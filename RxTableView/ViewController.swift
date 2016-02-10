//
//  ViewController.swift
//  RxTableView
//
//  Created by Patrick Balestra on 2/7/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.configureCell = { table, indexPath, user in
            let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            let string = "\(user.screenName) is following \(user.followingCount) users and is followed by \(user.followersCount) users."
            cell.textLabel?.text = string
            cell.textLabel?.numberOfLines = 0
            cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.whiteColor() : UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
            return cell
        }
        
        viewModel.getUsers()
            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposeBag)
        
    }

}

