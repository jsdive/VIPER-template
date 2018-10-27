//
//  UIViewController+TransitionHandler.swift
//  Testify
//
//  Created by Vitaliy on 28/10/2018.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

extension UIViewController: TransitionHandler {
    var hidesTabBarWhenPushed: Bool {
        get {
            return hidesBottomBarWhenPushed
        }
        set {
            hidesBottomBarWhenPushed = newValue
        }
    }
    
    func pushModule(with viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func presentModule(with viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func presentNavigationController(with viewController: UIViewController, shouldShowNavigationBar: Bool = true) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = !shouldShowNavigationBar
        present(navigationController, animated: true, completion: nil)
    }
    
    func replaceNavigationStack(with viewController: UIViewController, animated: Bool) {
        navigationController?.setViewControllers([viewController], animated: animated)
    }
    
    func replaceTopViewController(with viewController: UIViewController, animated: Bool) {
        guard var viewControllers = navigationController?.viewControllers.dropLast() else { return }
        viewControllers.append(viewController)
        navigationController?.setViewControllers(Array(viewControllers), animated: animated)
    }
    
    func back(animated: Bool) {
        guard let navigationController = navigationController else {
            dismiss(animated: animated, completion: nil)
            return
        }
        
        if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
        } else {
            navigationController.dismiss(animated: animated, completion: nil)
        }
    }
    
    func dismiss() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    static func createViewController(withType type: UIViewController.Type) -> UIViewController {
        return type.init(nibName: String(describing: type), bundle: nil)
    }
}
