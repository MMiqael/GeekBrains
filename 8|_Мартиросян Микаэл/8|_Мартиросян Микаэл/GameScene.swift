//
//  GameScene.swift
//  8|_Мартиросян Микаэл
//
//  Created by Микаэл Мартиросян on 19.04.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import SpriteKit
import GameplayKit

//категория пересчения объектов
struct CollisionCategories{
    //Тело змеи
    static let Snake :     UInt32 = 0x1 << 0
    //Голова змеи
    static let SnakeHead : UInt32 = 0x1 << 1
    //Яблоко
    static let Apple:       UInt32 = 0x1 << 2
    //Край сцены (экрана)
    static let EdgeBody:   UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    //наша змея
    var snake: Snake?
    
    //вызывается при первом запуске сцены
    override func didMove(to view: SKView) {
        
        //цвет фона сцены
        backgroundColor = SKColor.black
        
        //вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        //добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //выключаем внешние воздействия на нашу игру
        self.physicsBody?.allowsRotation = false
        
        //включаем оторажение отладочной информации
        view.showsPhysics = true

        //делаем нашу сцену делегатом соприкосновений
        self.physicsWorld.contactDelegate = self
        
        //Устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        //устанавливаем категории с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
        
        // Поворот против часовой стрелки
        //создаем ноду (объект)
        let counterClockwiseButton = SKShapeNode()
        //задаем форму круга
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        //указываем координаты размещения
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        //цвет заливки
        counterClockwiseButton.fillColor = UIColor.gray
        //цвет рамки
        counterClockwiseButton.strokeColor = UIColor.gray
        //толщина рамки
        counterClockwiseButton.lineWidth = 10
        //имя объекта для взаимодействия
        counterClockwiseButton.name = "counterClockwiseButton"
        
        //Добавляем на сцену
        self.addChild(counterClockwiseButton)
        
        
        // Поворот по часовой стрелке
        
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY+30)
        clockwiseButton.fillColor = UIColor.gray
        clockwiseButton.strokeColor = UIColor.gray
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        
        self.addChild(clockwiseButton)
        
        createApple()
        
        //создаем змею по центру экрана и добавляем ее на сцену
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    //вызывается при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //перебераем все точки куда прикоснулся палец
        for touch in touches {
            //определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            
            //проверяем есть ли обьект по этим координатам, и если есть, то не наша ли это кнопка
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            //если это наша кнопка заливаем ее зеленой
            touchedNode.fillColor = .green
            
            // определяем какая кнопка нажата и поворачиваем в нужную сторону
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
    //вызывается при прекращении нажатия на экран
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //повторяем все то же самое для действия когда палец отрывается от экрана
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            //но делаем цвет снова серый
            touchedNode.fillColor = UIColor.gray
        }
    }
    
    //вызывается при обрыве нажатия на экран, например если телефон примет звонок и свернет приложение
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //вызывается при обработке кадров сцены
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func restart() {
        guard case let scene == scene else {
            return
        }
    
    }
    
    //создаем яблоко в случайной точке сцены
    func createApple(){
        // Случайная точка на экране
        let randX  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-5)) + 1)
        let randY  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-5)) + 1)
        
        // Создаем яблоко
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        //добавляем яблоко на сцену
        self.addChild(apple)
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        //логическая сумма масок сопрекоснувшихся объектов
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        //вычитаем из суммы голову змеи и у нас остается маска второго объекта
        let collisionObject = bodyes - CollisionCategories.SnakeHead
        
        //проверяем что это за второй объект
        switch collisionObject {
        case CollisionCategories.Apple: //проверяем что это яблоко
            //яблоко это один из двух объектов, используем тернарный оператор что бы вычислить какой
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            //добавляем к змее еще одну секцию
            snake?.addBodyPart()
            //удаляем яблоко
            apple?.removeFromParent()
            //создаем новое яблоко
            createApple()
        case CollisionCategories.EdgeBody: //проверяем что это стенка экрана
            
//            let edge = contact.bodyA.node is EdgeBody ? contact.bodyA.node : contact.bodyB.node
            
            break //соприкосновение со стеной будет домашним заданием
        case CollisionCategories.Snake:
//            let snakeBody = contact.bodyA.node is Snake ? contact.bodyA.node : contact.bodyB.node
            restat()
            break
        default:
            break
        }
    }
}
