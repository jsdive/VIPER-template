//
//  TransitionHandler.swift
//  Testify
//
//  Created by Vitaliy on 28/10/2018.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

protocol TransitionHandler: class {    
    var hidesTabBarWhenPushed: Bool { get set }
    
    func pushModule(with viewController: UIViewController, animated: Bool)
    
    func presentModule(with viewController: UIViewController)
    
    func presentNavigationController(with viewController: UIViewController, shouldShowNavigationBar: Bool)
    
    func replaceNavigationStack(with viewController: UIViewController, animated: Bool)
    
    func replaceTopViewController(with viewController: UIViewController, animated: Bool)
    
    func back(animated: Bool)
    
    func dismiss()
}

extension TransitionHandler {
    func presentNavigationController(with viewController: UIViewController, shouldShowNavigationBar: Bool = true) {
        presentNavigationController(with: viewController, shouldShowNavigationBar: shouldShowNavigationBar)
    }
    
    func pushModule(with viewController: UIViewController, animated: Bool = true) {
        pushModule(with: viewController, animated: animated)
    }
    
    func back(animated: Bool = true) {
        back(animated: animated)
    }
}
