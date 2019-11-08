//
//  Banner.swift
//  BannerView
//
//  Created by Himshikhar Gayan on 10/10/19.
//  Copyright © 2019 Vantage Circle. All rights reserved.
//

import UIKit
import FSPagerView

@IBDesignable
class Banner : XibView, FSPagerViewDelegate, FSPagerViewDataSource {
 
    var delegate:BannerDelegate? { didSet {
        self.banner.dataSource = self
        self.banner.delegate = self
        self.backgroundColor = UIColor.init(white: 1, alpha: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var banner: FSPagerView! {
        didSet {
            self.setupBannerUI()
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.setupPageControl()
        }
    }
    
    private func setupBannerUI(){
        self.banner.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.banner.transformer = FSPagerViewTransformer(type: .coverFlow)
        self.banner.itemSize = CGSize.init(width: UIScreen.main.bounds.size.width - 20, height: 180)
        self.banner.contentMode = .scaleAspectFit
        self.banner.delegate = self
        self.banner.dataSource = self
        //self.setAutoChange()
    }
    
    private func setAutoChange(){
        self.banner.isInfinite = self.delegate?.shouldAutoChange() ?? true
        
        if let autoChange = self.delegate?.shouldAutoChange(), autoChange {
            self.banner.automaticSlidingInterval = CGFloat(self.delegate?.timeIntervalForChangingBanner() ?? 0)
        }
    }
    
    private func setupPageControl(){
        self.pageControl.contentHorizontalAlignment = .center
        self.pageControl.hidesForSinglePage = true
    }
    
    func reloadData(){
        self.pageControl.numberOfPages = self.delegate?.numberOfItemsInBanner(banner: self) ?? 0
        self.pageControl.setFillColor(self.delegate?.primaryTintColor(), for: UIControl.State())
        self.pageControl.setStrokeColor(self.delegate?.primaryTintColor(), for: UIControl.State())
        self.setAutoChange()
        self.banner.reloadData()
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.delegate?.numberOfItemsInBanner(banner: self) ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let pagerCell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        if let img = self.delegate?.imageForItemInBanner(banner: self, at: index) { pagerCell.imageView?.image = UIImage(named: img) }
        pagerCell.backgroundColor = .white
        self.pageControl.currentPage = index
        return pagerCell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        self.delegate?.didSelectBannerAt(index: index)
    }
    
}

protocol BannerDelegate:class {
    func numberOfItemsInBanner(banner:Banner)->Int
    func imageForItemInBanner(banner:Banner, at index:Int)->String
    func didSelectBannerAt(index:Int)
    func primaryTintColor()->UIColor
    func shouldAutoChange()->Bool
    func timeIntervalForChangingBanner()->Int
}

struct BannerData {
    var id:Int
    var image:String
    var text:String
}


