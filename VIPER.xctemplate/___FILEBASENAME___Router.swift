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

final class ___VARIABLE_moduleName___Router: ___VARIABLE_moduleName___RouterInterface {

    static func createModule(viewRef: ___VARIABLE_moduleName___ViewController) {
        let presenter: ___VARIABLE_moduleName___PresenterInterface = ___VARIABLE_moduleName___Presenter()
        
        viewRef.presenter = presenter
        viewRef.presenter?.router = ___VARIABLE_moduleName___Router()
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.interactor = ___VARIABLE_moduleName___Interactor()
        viewRef.presenter?.interactor?.presenter = presenter
    }

}
