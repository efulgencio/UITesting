//
//  BoardToDeathUITests.swift
//  BoardToDeathUITests
//
//  Created by eduardo fulgencio on 01/03/2020.
//  Copyright © 2020 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import BoardToDeath

class BoardToDeathUITests: XCTestCase {

    var app:XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testOnBoarding_WhenShiped() {
        app.launch()
        
        XCTAssertTrue(app.staticTexts["Welcome to BoardToDeath"].exists)
        app.swipeLeft()
        XCTAssertTrue(app.staticTexts["Custom Puppy Content"].exists)
        
    }

    func testTemp() {
      app.launch()
        
      app.swipeLeft()
      app.swipeLeft()
      app.buttons["Done"].tap()
    }
    
    func testOnboarding_WhenFinished_OnboardVCDismisses() {
        app.launch()
        XCTAssertTrue(app.isDisplayingOnboarding)
        
           app.swipeLeft()
           app.swipeLeft()
        
        app.buttons["Done"].tap()
        XCTAssertFalse(app.isDisplayingOnboarding)
    }
    
    func testEmailInput_WhenGiveEmail() {
      app.launch()
        
           app.swipeLeft()
           app.swipeLeft()
        
        app.buttons["Done"].tap()
        
      let emailTextField = app.textFields["Email"]
      emailTextField.tap()
      emailTextField.typeText("caled@test.com")
        
        XCTAssertTrue(app.textFields["caled@test.com"].exists)
    }
    
    func testImagen() {
        app.launch()

        let imageCaption = app.staticTexts["What a beautiful image!"]
        let exists = NSPredicate(format:"exists = true")
        expectation(for: exists, evaluatedWith:imageCaption, handler:nil)
        
        app.swipeLeft()
        app.swipeLeft()
        app.buttons["Done"].tap()
        
        app.buttons["Load Image"].tap()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(imageCaption.exists)
    }

    

}

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
      return otherElements["onboardingView"].exists  // otherElements is for view
    }
}
