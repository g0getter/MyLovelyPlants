//
//  CalendarFeature.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 8/15/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CalendarFeature {
    @ObservableState
    struct State {
        var selectedDates = Set<DateComponents>()
    }
    
    enum Action {
        case tapDate(_ selectedDates: Set<DateComponents>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .tapDate(dates):
                state.selectedDates = dates
                return .none
            }
        }
    }
}
