//
//  ViewController.swift
//  MyCharts
//
//  Created by Niveus Solutions on 6/22/20.
//  Copyright © 2020 Niveus Solutions. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {

    var barChartView = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barChartView.delegate = self
       
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.gridLineWidth = 0.5
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.setLabelCount(4, force: false)
                
        let yAxis = barChartView.leftAxis
        yAxis.labelPosition = .outsideChart
        yAxis.setLabelCount(5, force: false)
        
        barChartView.animate(xAxisDuration: 2.5)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChartView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width-100, height: view.frame.size.height-100)
        barChartView.center = view.center
        view.addSubview(barChartView)
        
        
        var entries = [BarChartDataEntry]()
        for x in 1..<5{
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = [UIColor.init(red: 255/255, green: 168/255, blue: 0, alpha: 1)]
        let data = BarChartData(dataSet: set)
        barChartView.data = data
        
    }

}

