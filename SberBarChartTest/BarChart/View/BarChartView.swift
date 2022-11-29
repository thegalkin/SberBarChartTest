//
//  BarChartView.swift
//  SberBarChartTest
//
//  Created by Никита Галкин on 11/29/22.
//

import SwiftUI

struct BarChartView: View {
	let barChart: BarChart
	
	@State private var viewSize: CGSize = .zero
	
	var body: some View {
		GeometryReader { (geo: GeometryProxy) in
			VStack(alignment: HorizontalAlignment.leading) {
				legend
				xyValues
			}.onChange(of: geo.size) { _ in
				viewSize = geo.frame(in: .global).size
			}
		}
	}
	
	private var xyValues: some View {
		HStack {
			ForEach(barChart.xAxisValues) { (xValue: BarChart.XValue) in
				VStack {
					yValueView(yValues: barChart.yValues(for: xValue))
					xValueView(name: xValue.name)
				}
			}
		}
	}
	
	private var legend: some View {
		HStack {
			ForEach(barChart.series) { (series: BarChart.Series) in
				HStack {
					Circle().frame(width: 5, height: 5).foregroundColor(series.suiColor)
					Text(series.name).foregroundColor(Color.gray)
				}
			}
		}
	}

	private func xValueView(name: String) -> some View {
		Text(name).foregroundColor(Color.secondary)
	}
	
	private func yValueView(yValues: [BarChart.YValue]) -> some View {
		VStack(spacing: 1.1) {
			ForEach(yValues) { (yValue: BarChart.YValue) in
				let height: CGFloat = getHeightForValue(value: yValue.value)
				Rectangle()
					.foregroundColor(barChart.color(for: yValue))
					.frame(height: height)
					.overlay (
						VStack {
							if height > 15 {
								Text(String(yValue.value)).foregroundColor(Color.gray)
							}
						}
					)
			}
		}
	}
}

extension BarChartView {
	private func getHeightForValue(value: Int) -> CGFloat {
		CGFloat(self.viewSize.height) / 4.0 * 0.1 * CGFloat(value)
	}
}

struct BarChartView_Previews: PreviewProvider {
	static private let mock: BarChart? = BarChart.mock
    static var previews: some View {
		if let mock = mock {
			BarChartView(barChart: mock)
		} else {
			EmptyView()
		}
    }
}
