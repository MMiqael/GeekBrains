//
//  Snake.swift
//  8|_Мартиросян Микаэл
//
//  Created by Микаэл Мартиросян on 19.04.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit
import SpriteKit

//сама змея
class Snake: SKShapeNode {
    //скорость перемещения
    let moveSpeed = 125.0
    //угол необходимый для расчета направления
    var angle: CGFloat = 0.0
    
    //массив где хранятся части змеи
    var body = [SnakeBodyPart]()
    
    //конструктор
    convenience init(atPoint point: CGPoint) {
        self.init()
        
        //змея начинается с головы, создадим ее
        let head = SnakeHead(atPoint: point)
        //и добавим в массив
        body.append(head)
        //и сделаем ее дочерним объектом.
        addChild(head)
    }

    //метод добавляет еще один сегмент змеи
    func addBodyPart(){
        //инстанцируем сегемент
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        //добавляем его в массив
        body.append(newBodyPart)
        //делаем дочерним объектом
        addChild(newBodyPart)
    }
    
    //перемещаем змейку
    func move(){
        //если у змейки нет головы то ничего не перемещаем
        guard !body.isEmpty else { return }

        //перемещаем голову
        let head = body[0]
        moveHead(head)

        //перемещаем все сегменты тела
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index-1]
            let currentBodyPart = body[index]
            moveBodyPart(previousBodyPart, c: currentBodyPart)
        }

    }
    
    //перемещаем голову
    func moveHead(_ head: SnakeBodyPart){
        //расчитываем смещение точки
        let dx = CGFloat(moveSpeed) * sin(angle);
        let dy = CGFloat(moveSpeed) * cos(angle);
        //смещаем точку назначения головы
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        //действие перемещения головы
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        //перемещаем голову
        head.run(moveAction)
    }
    
    //перемещаем сегменты змеи
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart){
        //перемещаем текущий элемент к предыдущему
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1 )
        //запускаем перемещение
        c.run(moveAction)
    }
    
    //поворот по часовой стрелке
    func moveClockwise(){
        //смещаем угол на 45 градусов
        angle += CGFloat(Double.pi/2)
    }
    
    //поворот против часовой стрелки
    func moveCounterClockwise(){
        angle -= CGFloat(Double.pi/2)
    }
}
