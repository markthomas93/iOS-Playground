//
//  HomeController.swift
//  NearbuyClone
//
//  Created by Himshikhar Gayan on 15/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit

struct TryData {
    var mainText,subText,imageName : String
}

class HomeController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerTopContraint: NSLayoutConstraint!
    @IBOutlet weak var stickyView: UIView!
    @IBOutlet weak var headerImageWIdth: NSLayoutConstraint!
    @IBOutlet weak var headerImageHeight: NSLayoutConstraint!
    @IBOutlet weak var exploreLabel: UILabel!
    
    
    let tryIdentifier = "TryCell"
    let shopIdentifier = "GiftCardCell"
    let bannerIdentifier = "BannerViewCell"
    
    var tryData : [TryData] = []
    var shopData : [TryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        populateData()
        setNavigation()
//        exploreText.attributedText = NSAttributedString.init(string: "Great Nearby Deals", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,
//        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
    }
    
    func setNavigation(){
        self.navigationController?.navigationBar.barTintColor = .white
        let text = [NSAttributedString.Key.foregroundColor : UIColor.black,
                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = text
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.visibleViewController?.navigationItem.title = "Nearbuy"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: .checkmark, style: .done, target: nil, action: #selector(add))
        self.navigationItem.rightBarButtonItem?.tintColor = .systemRed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    @objc func add(){
        
    }
    
    func populateData(){
        tryData = [
            TryData.init(mainText: "Win Free Amazon Vouchers ", subText: "Win Free Amazon Vouchers worth Rs. 1000", imageName: "amazon"),
            TryData.init(mainText: "Win Free Amazon Vouchers ", subText: "Win Free Amazon Vouchers worth Rs. 1000", imageName: "amazon"),
            TryData.init(mainText: "Win Free Amazon Vouchers ", subText: "Win Free Amazon Vouchers worth Rs. 1000", imageName: "amazon"),
            TryData.init(mainText: "Win Free Amazon Vouchers ", subText: "Win Free Amazon Vouchers worth Rs. 1000", imageName: "amazon"),

        ]
        shopData = [
        TryData.init(mainText: "Amazon Vouchers ", subText: "Rs.1000", imageName: "amazon"),
        TryData.init(mainText: "Amazon Vouchers ", subText: "Rs.1000", imageName: "amazon"),
        TryData.init(mainText: "Amazon Vouchers ", subText: "Rs.1000", imageName: "amazon"),
        TryData.init(mainText: "Amazon Vouchers ", subText: "Rs.1000", imageName: "amazon")
        ]
    }
    
    func setUpTable(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.headerHeightConstraint.constant = 0
        homeTableView.register(UINib.init(nibName: tryIdentifier, bundle: nil), forCellReuseIdentifier: tryIdentifier)
        homeTableView.register(UINib.init(nibName: shopIdentifier, bundle: nil), forCellReuseIdentifier: shopIdentifier)
        homeTableView.register(UINib.init(nibName: bannerIdentifier, bundle: nil), forCellReuseIdentifier: bannerIdentifier)
    }
    
    func stickyHeaderView(height: CGFloat) -> UIView{
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: homeTableView.frame.width, height: 40))
        view.frame.size.height = height
        let label  = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: homeTableView.frame.width, height: 40))
        label.frame.size.height = height
        label.text = "Header"
        view.addSubview(label)
        return view
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
            headerHeightConstraint.constant = 80
            headerTopContraint.constant = 20
            stickyView.backgroundColor = .white
            self.headerImageWIdth.constant = 40
            self.headerImageHeight.constant = 40
            UIView.animate(withDuration: 1){
                self.view.layoutIfNeeded()
            }
            print("top")
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
            headerHeightConstraint.constant = 0
            UIView.animate(withDuration: 1){
                self.view.layoutIfNeeded()
            }
            print("bottom")
        }
    }
    
}

extension HomeController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return tryData.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            navigationController?.pushViewController(DeatailViewController2(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: bannerIdentifier) as? BannerViewCell
            return cell ?? UITableViewCell()
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: tryIdentifier) as? TryCell
            cell?.setData(tryData: tryData[indexPath.row])
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: shopIdentifier) as? GiftCardCell
            cell?.collectionView.delegate = self as UICollectionViewDelegate
            cell?.collectionView.dataSource = self as UICollectionViewDataSource
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 190
        }else if indexPath.section == 1 {
            return UITableView.automaticDimension
        }else {
            return CGFloat(150 * shopData.count/2)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Banner"
        }else if section == 1{
            return "Try your Luck"
        }else {
            return "Shop gift cards"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: shopIdentifier) as? GiftCardCell
        cell?.collectionView.reloadData()
        cell?.collectionView.contentOffset = .zero
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        }else if section == 1 {
            let v = HeaderView()
            v.leftText.text = "Try Your Luck"
            v.rightText.text = "Show more"
            return v
        }else{
            let v = HeaderView()
            v.leftText.text = "Deals"
            v.rightText.text = "Explore"
            return v
        }
    }
    
}

extension HomeController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shopData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionCell", for: indexPath) as? GiftCollectionCell
        cell?.mainLabel.text = self.shopData[indexPath.row].mainText
        cell?.subLabel.text = self.shopData[indexPath.row].subText
        cell?.collectionImage.image = UIImage(named: "amazon")
        return cell ?? UICollectionViewCell()
    }
    
}

extension HomeController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath) selected")
    }
}

extension HomeController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 180, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
