//
//  BarChart.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import Foundation
import SwiftUI

struct BarChart: Codable {
	let series: [Series]
	let xAxisValues: [XValue]
	let yAxisValues: [YValue]
}

extension BarChart {
	struct Series: Codable, Identifiable {
		let id: Int
		let name: String
		let ord: Int
		let color: String
	}
	
	struct XValue: Codable, Identifiable {
		let id: Int
		let name: String
		let ord: Int
	}
	
	struct YValue: Codable, Identifiable {
		let seriesId: Int
		let xAxisValueId: Int
		let value: Int
		
		let id: UUID = .init()
	}
}



extension BarChart.Series {
	var suiColor: Color {
		Color(hex: self.color)
	}
}

extension BarChart {
	func yValues(for xValue: XValue) -> [YValue] {
		self.yAxisValues.filter { (yValue: YValue) in
			yValue.xAxisValueId == xValue.id
		}
	}
	func color(for yValue: YValue) -> Color {
		self.series.first { (series: Series) in
			series.id == yValue.seriesId
		}?.suiColor ?? Color.black
	}
}
