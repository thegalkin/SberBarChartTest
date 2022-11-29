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
	//bundle main почему-то всегда возвращало nil, поэтому решил отказаться, но оставляю в качестве демонстрации. Подход с файлом правильней с точки зрения заменяемости мока.
//	static let mockData: Data? = {
//		let path = Bundle.main.path(forResource: "BarChartMockData", ofType: "json", inDirectory: "BarChart/Mock")
//		if let path = path, let url = URL(string: path), let data = try? Data(contentsOf: url) {
//			return data
//		}
//		return nil
//	}()
	static let mockData: Data? = {
		mockString.data(using: .utf8)
	}()
	
	static let mockString: String =
		"""
{
	"series": [
		{
			"name": "Выявлено",
			"id": 100,
			"ord": 3,
			"color": "#4061F6"
		},
		{
			"name": "Госпитализировано",
			"id": 200,
			"ord": 1,
			"color": "#EA7450"
		},
		{
			"name": "Выздоровело",
			"id": 300,
			"ord": 2,
			"color": "#5BC5A6"
		}
	],
	"xAxisValues": [
		{
			"name": "Москва",
			"id": 1,
			"ord": 1
		},
		{
			"name": "Санкт-Петербург",
			"id": 2,
			"ord": 2
		},
		{
			"name": "Свердловская область",
			"id": 3,
			"ord": 4
		},
		{
			"name": "Воронежская область",
			"id": 4,
			"ord": 3
		}
	],
	"yAxisValues": [
		{
			"seriesId": 100,
			"xAxisValueId": 1,
			"value": 926
		},
		{
			"seriesId": 200,
			"xAxisValueId": 1,
			"value": 122
		},
		{
			"seriesId": 300,
			"xAxisValueId": 1,
			"value": 554
		},
		{
			"seriesId": 100,
			"xAxisValueId": 2,
			"value": 517
		},
		{
			"seriesId": 200,
			"xAxisValueId": 2,
			"value": 22
		},
		{
			"seriesId": 300,
			"xAxisValueId": 2,
			"value": 28
		},
		{
			"seriesId": 100,
			"xAxisValueId": 3,
			"value": 147
		},
		{
			"seriesId": 200,
			"xAxisValueId": 3,
			"value": 4
		},
		{
			"seriesId": 300,
			"xAxisValueId": 3,
			"value": 102
		},
		{
			"seriesId": 100,
			"xAxisValueId": 4,
			"value": 139
		},
		{
			"seriesId": 200,
			"xAxisValueId": 4,
			"value": 14
		},
		{
			"seriesId": 300,
			"xAxisValueId": 4,
			"value": 82
		}
	]
}

"""
	
}
