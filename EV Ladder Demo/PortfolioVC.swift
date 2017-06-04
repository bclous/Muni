//
//  ViewController.swift
//  EV Ladder Demo
//
//  Created by Brian Clouser on 5/31/17.
//  Copyright © 2017 Clouser. All rights reserved.
//

import UIKit

class PortfolioVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    var labels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var values : [CGFloat] = [0.15, 0, 0, 0.10, 0.07, 0.13, 0.08, 0.12, 0.13, 0.10, 0.10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatTableView()
        formatNavBar()
    }
    
    func formatNavBar() {
//        let navBarImageView = UIImageView(image: UIImage(named: "EVLOGO"))
//        navBarImageView.clipsToBounds = true
//        navigationItem.titleView = navBarImageView
    }
}

extension PortfolioVC: UITableViewDelegate, UITableViewDataSource {
    
    func formatTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "ThreeBoxTableViewCell", bundle: nil), forCellReuseIdentifier: "threeBoxCell")
        mainTableView.register(UINib(nibName: "NameAndAmountCell", bundle: nil), forCellReuseIdentifier: "nameAndAmountCell")
        mainTableView.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "basicCell")
        mainTableView.register(UINib(nibName: "CreditBreakdownCell", bundle: nil), forCellReuseIdentifier: "creditCell")
        mainTableView.register(UINib(nibName: "MaturityGraphCell", bundle: nil), forCellReuseIdentifier: "maturityCell")
        mainTableView.register(UINib(nibName: "BondPositionCell", bundle: nil), forCellReuseIdentifier: "bondCell")
    
        mainTableView.separatorStyle = .none

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 || section == 2 {
            return 3
        } else { 
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameAndAmountCell", for: indexPath) as! NameAndAmountCell
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "threeBoxCell", for: indexPath) as! ThreeBoxCell
                cell.formatCell(type: .portfolioStyle)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! BasicCell
                cell.leftLabel.text = indexPath.row == 1 ? "Reinvest coupons?" : "Maintain structure or roll down curve?"
                cell.rightLabel.text = indexPath.row == 1 ? "Yes" : "Roll"
                return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "threeBoxCell", for: indexPath) as! ThreeBoxCell
                cell.formatCell(type: .portfolioBreakdown)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "creditCell", for: indexPath) as! CreditBreakdownCell
                cell.formatCell(rowHeight: 130, frameWidth: view.frame.width, AAA: 0.15, AA: 0.30, A: 0.30, BBB: 0.20, belowBBB: 0.05)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "maturityCell", for: indexPath) as! MaturityGraphCell
                cell.formatGraphCell(labels: labels, values: values, cellHeight: 130, spacing: 5)
                return cell
            }
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bondCell", for: indexPath) as! BondPositionCell
            cell.formatCell()
            return cell
        }   
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else if indexPath.section == 1 && (indexPath.row != 0) {
            return 40
        } else if indexPath.section == 2 && indexPath.row != 0 {
            return 130
        } else if indexPath.section == 3 {
            return 80
        } else {
            return 118
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
            view.backgroundColor = UIColor.red
            return view
        } else {
            let view = SectionHeaderView()
            if section == 1 {
                view.label.text = "LADDER MODEL"
            } else if section == 2 {
                view.label.text = "PORTFOLIO SUMMARY"
            } else {
                view.label.text = "INDIVIDUAL POSITIONS"
            }
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

