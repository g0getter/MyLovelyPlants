//
//  MyLovelyPlantsTests.swift
//  MyLovelyPlantsTests
//
//  Created by 여나경 on 8/26/24.
//

import ComposableArchitecture
import XCTest

@testable import MyLovelyPlants

@MainActor // prevents the main thread error
final class MyLovelyPlantsTests: XCTestCase {

    func testMyLovelyPlants() async {
        let store = TestStore(initialState: CalendarFeature.State()) {
            CalendarFeature()
        }
        
//        let selectedDates = Set<DateComponents>()
//        await store.send(.tapDate(selectedDates)) {
//            $0.isLoading = true
//            $0.selectedDates = selectedDates
//        }
        
        let stringFact = "factResponse"
        await store.send(.factResponse(stringFact)) {
            $0.isLoading = false
            $0.fact = stringFact
        }
//        await store.send(.requestNetwork(2)) {
    }
}
