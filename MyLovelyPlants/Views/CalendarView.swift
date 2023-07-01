//
//  CalendarView.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 2023/07/01.
//

import SwiftUI

struct CalendarView: View {
    @State private var dates: Set<DateComponents> = [DateComponents(
        timeZone: nil, year: 2023, month: 7, day: 3)]
    @State private var selectedDates = ""

    var body: some View {
        if #available(iOS 16.0, *) {
            VStack {
                MultiDatePicker("Dates Available", selection: $dates)
                    .tint(.orange)
                    .onChange(of: dates, perform: { _ in
                        formatSelectedDates(dates)
                    })
                Text("The days you watered")
                    .foregroundColor(.orange)
                ScrollView {
                    LazyVStack {
                        Text(selectedDates)
                    }
                }
            }
        } else {
            SampleView()
        }
    }
    
    private func formatSelectedDates(_ dates: Set<DateComponents>) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let datesToBeFormatted = dates
            .compactMap { dateComponent in
                Calendar.current.date(from: dateComponent)
            }.compactMap { date in
                dateFormatter.string(from: date)
            }
        selectedDates = datesToBeFormatted.joined(separator: "\n") // reduce로도 가능하나 int 이용한 연산 등이 아니라서 이것보다 식이 길어짐
    }
    
    // TODO: 오름차순 정렬 - paramter type, return type 정의
    // - formatSelectedDates로 포매팅한 후 정렬
    private func sortSelectedDates(_ dates: Set<DateComponents>) {}
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
