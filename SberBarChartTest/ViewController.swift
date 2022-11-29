//
//  ViewController.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import UIKit

class ViewController: UIViewController {
	lazy var stackView: UIStackView = {
		let st = UIStackView()
		if UIDevice.current.orientation.isPortrait {
			st.axis = .vertical
		} else {
			st.axis = .horizontal
		}
		st.distribution = .equalSpacing
		st.alignment = .center
		st.spacing = 0
		st.translatesAutoresizingMaskIntoConstraints = false
		
		return st
	}()
	lazy var barChartView: UIView = {
		createBarChart() ?? UIView()
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		addStackViewToViewHeirarchy()
		addBarchartToViewHeirarchy()
		prepareVC()
	}
	
	private func prepareVC() {
		self.view.backgroundColor = UIColor.systemBackground
	}
	
	override func viewDidLayoutSubviews() {
		layoutBarchartView()
	}
		
	
	private func layoutBarchartView() {
		barChartView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			barChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			barChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			barChartView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			barChartView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			barChartView.heightAnchor.constraint(equalToConstant: 400),
		])
	}
	
	
	private func addBarchartToViewHeirarchy() {
		
		self.view.addSubview(barChartView)
	}
	
	private func addStackViewToViewHeirarchy() {
//		self.view.addSubview(stackView)
	}
		
	private func createBarChart() -> UIView? {
		if let data: Data = BarChart.mockData {
			return MyChartFactory.chart(data: data)
		}
		return nil
	}
}

