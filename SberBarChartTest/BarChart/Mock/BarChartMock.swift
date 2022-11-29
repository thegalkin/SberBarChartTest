//
//  BarChartMock.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import Foundation
extension BarChart {
	static let mock: BarChart? = {
		if let data = BarChart.mockData {
			let decoder = JSONDecoder()
			if let decoded = try? decoder.decode(BarChart.self, from: data) {
				return decoded
			}
		}
		
		return nil
	}()
	
	static let mockData: Data? = {
		let path = Bundle.main.path(forResource: "BarChartMockData", ofType: "json")
		if let path = path, let url = URL(string: path), let data = try? Data(contentsOf: url) {
			return data
		}
		return nil
	}()
}
