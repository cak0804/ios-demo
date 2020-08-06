//
//  main.swift
//  class_swift-7-26
//
//  Created by bytedance on 7/26/20.
//

import Foundation

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var height = 0.0
    var width = 0.0
}

class Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            let centerX = origin.x+(size.width/2)
            let centerY = origin.y+(size.height/2)
            return Point(x:centerX,y:centerY)
        }
        set(newCenter){
            origin.x = newCenter.x-(size.width/2)
            origin.y = newCenter.y-(size.height/2)
        }
    }
    
}

var square = Rect()
square.origin = Point(x:0.5,y:0.7)
square.size = Size(height: 8, width: 10)
//let initialSquareCenter = square.center
//print(initialSquareCenter.x,initialSquareCenter.y)
//square.center = Point(x:0.5,y:0.6)
//print(square.origin.x,square.origin.y)

class StepCounter{
    var totalSteps: Int=0{
        willSet(newTotalSteps){
//            print("set new step:\(newTotalSteps)")
        }
        didSet{
            if totalSteps>oldValue{
//                print("add \(totalSteps-oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300

//装饰器
@propertyWrapper
struct TwelveOrLess{
    private var number:Int
    init(){
        self.number = 5
    }
    var wrappedValue:Int{
        get{return number}
        set{number = min(newValue,12)}
    }
}

@propertyWrapper
struct Smallnumber {
    private var maximum: Int
    private var number: Int
    var wrappedValue: Int{
        get{return number}
        set{number = min(newValue,maximum)}
    }
    init(){
        maximum = 12
        number = 0
    }
    init(Value:Int){
        maximum = 12
        number = min(Value,maximum)
        print("init here")
    }
    
        }

struct SmallRectangle {
    @TwelveOrLess var height:Int
    @TwelveOrLess var width:Int
        }

struct narrowrectangle {
    @Smallnumber(Value: 4) var height:Int
    @Smallnumber(Value: 5) var width:Int
        }

//struct AudioChannel {
//    static let thresholdLevel = 10
//    static var maxInputLevelForAllChannels = 0
//    var currentLevel: Int = 0 {
//        didSet {
//            if currentLevel > AudioChannel.thresholdLevel {
//                // cap the new audio level to the threshold level
//                print("1")
//                currentLevel = AudioChannel.thresholdLevel
//            }
//            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
//                // store this as the new overall maximum input level
//                print("2")
//                AudioChannel.maxInputLevelForAllChannels = currentLevel
//            }
//        }
//    }
//}
//var left = AudioChannel()
//var right = AudioChannel()
//left.currentLevel = 7

//struct and enum 是值类型，不能从实例方法中修改值类型的数属性，但是class是引用类型所以可以
class Counter{
    var count = 0
    func increment(){
        count+=1
    }
    func increment(_ amount:Int){
        count+=amount
    }
    func reset()  {
        count = 0
    }
}
//let count = Counter()
//count.increment(3)
//print(count.count)

//当struct和enum想要改变值类型时，要使用mutating方法
struct anotherCounter{
    var count = 0
    mutating func increment(_ deltacount:Int){
        count+=deltacount
    }
}

//var count1 = anotherCounter()
//count1.increment(3)
//print(count1.count)

struct LevelTracker{
    static var highestUnlockedlevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level>highestUnlockedlevel{
            highestUnlockedlevel = level
        }
    }
    static func isunlocked(_ level:Int)->Bool{
        return level<=highestUnlockedlevel
    }
    
    @discardableResult
    mutating func advance(to level:Int)->Bool{
        if LevelTracker.isunlocked(level){
            currentLevel = level
            return true
        }
        else {return false}
    }
}

class player{
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){
        LevelTracker.unlock(level+1)
        tracker.advance(to: level+1)
    }
    init(name:String){
        playerName = name
    }
}
var p = player(name: "yang")
p.complete(level:1)
//print("highest unlock level is now \(LevelTracker.highestUnlockedlevel)")

enum Planet:Int{
    case mercury=1,venus,earth,mars,jupiter,saturn,uranus,neptune
    static subscript(n:Int)->Planet{
        return Planet(rawValue:n)!
    }
}

class chessBoard{
    let boardColor:[[Bool]] = {
        var isBlack = false
        var tmpBoard = [[Bool]]()
        for i in 1...8{
            var tmp = [Bool]()
            for j in 1...8{
                tmp.append(isBlack)
                isBlack = !isBlack
            }
            tmpBoard.append(tmp)
        }
        return tmpBoard
    }()
    subscript(_ row:Int,_ column:Int)->Bool{
        return boardColor[row][column]
    }
    deinit {
        print("out")
    }
}
//var board : chessBoard? = chessBoard()
//var value = board![1,3]
//print(value)
//board = nil

class Room{
    let name:String
    init(name:String) {
        self.name = name
    }
}

class Adress{
    var buildingName : String?
    var buildingNumber : String?
    var street : String?
    func buildingIdentifacation()->String?{
        if let buildingNumber = buildingNumber,let street = street{
            return "\(buildingNumber) \(street)"
        }
        else if let buildingName = buildingName{
            return buildingName
        }
        else{return nil}
    }
}

class Residence{
    var rooms = [Room]()
    var numberOfRooms:Int{return rooms.count}//计算属性
    var address:Adress?
    subscript(i:Int)->Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }

        }

class Person{
    var residence:Residence?
}
//let John = Person()
//if let roomCount = John.residence?.numberOfRooms{
//    print(roomCount)
//}
//else{print("can't get number")}

protocol fullName {
    var fullname: String{get}
        }

struct person: fullName {
    var fullname: String
        }

class starShip: fullName{
    var prefix: String?
    var name:String
    init(name:String,prefix:String?=nil){
        self.prefix = prefix
        self.name = name
    }
    var fullname: String{
        if let prefix = prefix{
            return prefix+" "+name
        }
        else {return name}
    }
}
//var ncc1701 = starShip(name: "enterprise",prefix: "uss")
//print(ncc1701.fullname)

struct Stack<T>{
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    mutating func pop()->T{
        return items.removeLast()
    }
}
class Stack_<T> {
    var items = [T]()
    func push(item:T){
        items.append(item)
        }
    func pop()->T{
        return items.removeLast()
    }
}

extension Stack{
    var topItem: T?{
        if !items.isEmpty{
            return items[items.count-1]
            
        }
        else{
                return nil
            }
        }
}

class 
