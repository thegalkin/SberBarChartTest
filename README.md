# SberBarChartTest
Тестовое задание. Сбербанк|Business Intellegence

Task:
Разработать компонент в который можно передать json в формате Data (utf8), а на выходе получить UIView отображающую полученные данные в виде диаграммы.
Не использовать сторонние библиотеки для построения диаграмм и маппинга данных.
Макет диаграммы в файле Макет.png.
Тестовые данные в файле Data.json.

Интерфейс компонента:

protocol ChartFactory {
    static func chart(data: Data) -> UIView?
}

enum MyChartFactory: ChartFactory {
    // todo
}

Result:



![simulator_screenshot_175694CC-604A-4C2C-A05C-F7513A072DF1](https://user-images.githubusercontent.com/53794828/204602122-46eefa4c-a022-41eb-81de-09ed6318d914.png)

![simulator_screenshot_E647A8BE-D93B-4BF8-AFB7-497D8C6F9DED](https://user-images.githubusercontent.com/53794828/204602172-aae8734c-ebfc-497c-b1a5-b48b1b0d4e49.png)
