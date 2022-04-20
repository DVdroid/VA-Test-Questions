//
//  VA_Test_QuestionsTests.swift
//  VA-Test-QuestionsTests
//
//  Created by Vikash Anand on 17/10/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import XCTest
@testable import VA_Test_Questions

class VA_Test_QuestionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //1. Test - Hen is an instance of a Fowl
    func test_Hen_Is_Instance_Of_Fowl() throws {
        //Given
        class MockHen: Fowl {
            //1st test
            typealias FowlType = MockHen

            //2nd test
            var identifier: String {
                return "MockHen"
            }

            func lay() -> Egg<FowlType> {
                return Egg.init(createFowl: {
                    return FowlType()
                })
            }
        }

        //When
        /*
         3rd test - MockHen and hatched object from egg(returned by lay() in Fowl protocol) layed by MockHen
         has same flowtype which implies that MockHen class is implementing correct lay() method from Fowl protocol
        */
        let mockHen = MockHen()
        let egg = mockHen.lay()
        let hatchedObject = try XCTUnwrap(egg.hatch())


        //Then
        //1st test
        XCTAssert(MockHen.FowlType.self == MockHen.self)

        //2nd test
        XCTAssertNotNil(mockHen.identifier)

        //3rd test
        XCTAssert(type(of: mockHen).FowlType == type(of: hatchedObject).FowlType)
    }

    //2. Test - Hens make other hens
    func test_Hens_Make_Other_Hens() throws {

        //Given
        let hen = Hen()

        //When
        let egg = hen.lay()
        let hatchedObject = try XCTUnwrap(egg.hatch())

        //Then
        XCTAssert(type(of: hatchedObject) == type(of:hen))
    }

    //3. Test - Other fowls don't make hens
    func test_Other_Fowls_Dont_Make_Hens() throws {

        //Given
        class Eagle: Fowl {
            typealias FowlType = Eagle

            var identifier: String {
                return "Eagle"
            }

            func lay() -> Egg<FowlType> {
                return Egg.init(createFowl: {
                    return FowlType()
                })
            }
        }

        let eagle = Eagle()

        //When
        let egg = eagle.lay()
        let hatchedObject = try XCTUnwrap(egg.hatch())

        //Then
        XCTAssert(type(of: hatchedObject) != type(of: Hen()))
    }

    //4. Test - Eggs can't hatch twice
    func test_Eggs_Cant_Hatch_Twice() throws {

        //Given
        let hen = Hen()

        //When
        let egg = hen.lay()
        let _ = try XCTUnwrap(egg.hatch())

        //Then
        try XCTAssertThrowsError(egg.hatch())
    }

}
