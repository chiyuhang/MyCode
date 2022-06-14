//
//  MapViewController.swift
//  0606WorldTrotter
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit
import MapKit

class MapViewController :UIViewController {
    
    private lazy var mapView = MKMapView()
    private lazy var segmentedControl = createSegmentedControl()

    
    func createSegmentedControl() -> UISegmentedControl{
        // 创建一个地图选择控制器
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid","Statelite"])
        segmentedControl.backgroundColor = UIColor.init(white: 1.0, alpha: 0.5)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }
    
    @objc
    func mapTypeChanged(_ segControl: UISegmentedControl) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
        setComponents()
        setConstraints()
        setApperance()
    }
    
    func setComponents() {
        view.addSubview(mapView)
        view.addSubview(segmentedControl)
    }
    
    func setConstraints() {
        mapView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func setApperance() {
        // 更改地图类型
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    }
    
}
