//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  The Viper template generated
//

import UIKit

protocol ___VARIABLE_moduleName___RouterInterface: class {
    static func createModule(viewRef: ___VARIABLE_moduleName___ViewController)

}

protocol ___VARIABLE_moduleName___ViewInterface: class {
    var presenter: ___VARIABLE_moduleName___PresenterInterface? { get }
}

protocol ___VARIABLE_moduleName___PresenterInterface: class {
    var router: ___VARIABLE_moduleName___RouterInterface? { get set }
    var interactor: ___VARIABLE_moduleName___InteractorInterface? { get set }
    var view: ___VARIABLE_moduleName___ViewInterface? { get set }
}

protocol ___VARIABLE_moduleName___InteractorInterface: class {
    var presenter: ___VARIABLE_moduleName___PresenterInterface? { get set }
}
