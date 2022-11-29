//
//  ViewController.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		addBarchartToViewHeirarchy()
	}
	
	private func layoutBarchartView(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
			view.heightAnchor.constraint(equalToConstant: 400),
		])
	}
	
	
	private func addBarchartToViewHeirarchy() {
		if let barChartView: UIView = self.createBarChart() {
			self.view.addSubview(barChartView)
			layoutBarchartView(view: barChartView)	
		}
	}
		
	private func createBarChart() -> UIView? {
		if let data: Data = BarChart.mockData {
			return MyChartFactory.chart(data: data)
		}
		return nil
	}
}

