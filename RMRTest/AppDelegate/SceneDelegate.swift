//
//  SceneDelegate.swift
//  RMRTest
//
//  Created by stanislav on 13.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private var assembler: Assembler!
    
    var window: UIWindow?
    
    override init() {
        super.init()
        setupInjection()
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let initialVC = assembler.resolver.resolve(UsersListVC.self)!
        let window = UIWindow(windowScene: windowScene)
        let navigationVC = UINavigationController(rootViewController: initialVC)
        
        window.rootViewController = navigationVC
        self.window = window
        window.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    
    private func setupInjection() {
        assembler = Assembler([UsersListAssembly(),
                               UserInfoAssembly(),
                               HelpersAssembly(),
                               ServicesAssembly(),
                               RepositoriesAssembly()])
    }
}

