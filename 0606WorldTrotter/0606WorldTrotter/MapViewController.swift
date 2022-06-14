//
//  MapViewController.swift
//  0606WorldTrotter
//
//  Created by ByteDance on 2022/6/7.
//

import UIKit
import MapKit

class MapViewController :UIViewController {
    
    var mapView: MKMapView!
    
//    func mapTypeChanged(segControl: UISegmentedControl) {
//        switch segControl.selectedSegmentIndex {
//        case 0:
//            mapView.mapType = .standard
//        case 1:
//            mapView.mapType = .hybrid
//        case 2:
//            mapView.mapType = .satellite
//        default:
//            break
//        }
//    }
    
//    override func loadView() {
//        // Create a map view
//        mapView = MKMapView()
//
//        // Set it as *the* view of this view controller
//        view = mapView
//
//        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
//        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
//        segmentedControl.selectedSegmentIndex = 0

    
    @objc func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    override func loadView() {
        // 创建一个地图视图
        mapView = MKMapView()
        view = mapView
        
        // 创建一个地图选择控制器
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid","Statelite"])
        segmentedControl.backgroundColor = UIColor.init(white: 1.0, alpha: 0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        // 监听地图类型切换事件
//        segmentedControl.addTarget(self, action: Selector("mapTypeChanged:"), for: .valueChanged)
        
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged),
                                   for: .valueChanged)
        
        // 解决引入自动布局之后的兼容性问题
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // 添加一些约束
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
    
    
}
