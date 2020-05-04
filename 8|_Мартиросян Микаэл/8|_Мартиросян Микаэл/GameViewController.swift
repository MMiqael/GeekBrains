//
//  GameViewController.swift
//  8|_Мартиросян Микаэл
//
//  Created by Микаэл Мартиросян on 19.04.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

struct GameStatus {
    var gameOver = false
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // создаем экземпляр сцены
        let scene = GameScene(size: view.bounds.size)
        //получаем главную область экрана
        let skView = view as! SKView
        //включаем отображение fps (Количество кадров в секунду)
        skView.showsFPS = true
        //показывать количество объектов на экране
        skView.showsNodeCount = true
        //включает включаем произволный порядок ренденги объектов в узле
        skView.ignoresSiblingOrder = true
        //режим отображения сцены, растягивается на все доступное пространство
        scene.scaleMode = .resizeFill
        //добавляем сцену на экран
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
