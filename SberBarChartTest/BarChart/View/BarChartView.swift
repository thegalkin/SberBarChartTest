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
		VStack {
			GeometryReader { (geo: GeometryProxy) in
				VStack(alignment: HorizontalAlignment.leading) {
					legend
					xyValues
				}.onAppear {
					viewSize = geo.size
				}.onChange(of: geo.size) { (newValue: CGSize) in
					viewSize = newValue
				}
			}.frame(maxHeight: CGFloat.infinity)
		}.padding(20)
	}
	
	private var xyValues: some View {
		ScrollView(.horizontal) {
			HStack(alignment: .bottom) {
				ForEach(barChart.xAxisValues) { (xValue: BarChart.XValue) in
					VStack {
						yValueView(yValues: barChart.yValues(for: xValue))
						xValueView(name: xValue.name)
					}
				}
			}.padding(.vertical, 10)
		}
	}
	
	private var legend: some View {
		HStack {
			ForEach(barChart.series) { (series: BarChart.Series) in
				HStack {
					Circle()
						.frame(width: 5, height: 5)
						.foregroundColor(series.suiColor)
					Text(series.name)
						.foregroundColor(Color.gray)
						.font(Font.system(size: 10))
				}
			}
		}
	}

	private func xValueView(name: String) -> some View {
		Text(name)
			.foregroundColor(Color.secondary)
			.font(Font.system(size: 10))
	}
	
	private func yValueView(yValues: [BarChart.YValue]) -> some View {
		VStack(spacing: 1.1) {
			Text(getTotalFor(yValues: yValues))
				.foregroundColor(Color.gray)
				.font(Font.system(size: 10))
			ForEach(yValues) { (yValue: BarChart.YValue) in
				let height: CGFloat = getHeightForValue(value: yValue.value)
				Rectangle()
					.foregroundColor(barChart.color(for: yValue))
					.frame(height: height)
					.overlay (
						VStack {
							if height > 15 {
								Text(String(yValue.value)).foregroundColor(Color.gray)
									.font(Font.system(size: 10))
							}
						}
					)
					.frame(minWidth: 80)
			}
		}
	}
}

extension BarChartView {
	private func getHeightForValue(value: Int) -> CGFloat {
		min(CGFloat(self.viewSize.height)/4,
			CGFloat(value) / min(CGFloat(self.viewSize.height), 4)
		)
	}
	
	private func getTotalFor(yValues: [BarChart.YValue]) -> String {
		let total: CGFloat = yValues.reduce(into: 0.0) { t, c in
			t += CGFloat(c.value)
		}
		
		return String(describing: total)
	}
}

struct BarChartView_Previews: PreviewProvider {
	static private let mock: BarChart? = BarChart.mock
    static var previews: some View {
		if let mock = mock {
			BarChartView(barChart: mock)
		} else {
			Text("ничего нет")
		}
    }
}
