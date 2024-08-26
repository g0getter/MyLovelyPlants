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
    struct State: Equatable {
        var selectedDates = Set<DateComponents>()
        var fact: String?
        var isLoading = false
    }
    
    enum Action {
        case tapDate(_ selectedDates: Set<DateComponents>)
        case requestNetwork(Int) // FIXME: Rename or change the structure not to name after the logic, but user action
        case factResponse(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .tapDate(dates):
                state.selectedDates = dates
                // example for a network request
                state.isLoading = true
                // 해당 action에서 network request 하는 것 아니므로 state.selectedDates.count도 사용 가능
                return .send(.requestNetwork(dates.count))
                
            case let .requestNetwork(count):
                // network request
                return .run { send in
                    let (data, _) = try await URLSession.shared
                      .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.factResponse(fact))
                }
                
            case let .factResponse(fact):
                state.isLoading = false
                state.fact = fact
                return .none
            }
        }
    }
}
