//
//  ChartFactory.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import SwiftUI


protocol ChartFactory {
	static func chart(data: Data) -> UIView?
}

enum MyChartFactory: ChartFactory {
	static func chart(data: Data) -> UIView? {
		let decoder = JSONDecoder()
		if let decoded = try? decoder.decode(BarChart.self, from: data) {
			return UIHostingController(rootView: BarChartView(barChart: decoded)).view
		}
		return nil
	}
}





