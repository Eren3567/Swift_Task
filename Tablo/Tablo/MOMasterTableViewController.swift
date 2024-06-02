//
//  MOMasterTableViewController.swift
//  Tablo
//
//  Created by Eren Çetintaş on 1.06.2024.
//
import UIKit
import GoogleMobileAds

class MOMasterViewController: UITableViewController, GADBannerViewDelegate {

    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Banner reklamını oluşturma
        bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // 320x50 boyutunda bir banner reklam oluşturur
        bannerView.adUnitID = "YOUR_AD_UNIT_ID" // AdMob'dan aldığınız reklam birimi ID'sini buraya ekleyin
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        // Banner reklamını ekranda göstermek için layout ayarları
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints([
            NSLayoutConstraint(item: bannerView!, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: bannerView!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        // Reklamı yükleme
        bannerView.load(GADRequest())
    }
    
    
}
