//
//  ViewController.swift
//  7-30-collectionView
//
//  Created by bytedance on 7/30/20.
//

import UIKit

class ViewController:UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var myCollectionView : UICollectionView!


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 5
        case 1:
            return 7
        default:
            return 5
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionCell
//        cell.label.backgroundColor = UIColor.white
        cell.label.text = "7-30"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.yellow
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reuseView = collectionHeader()
        reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! collectionHeader
        reuseView.titileLabel.text = "header"
        return reuseView
    }
    
//    func collectionview
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 150)
        }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        //设置组内间距
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
//        layout.minimumInteritemSpacing = 5
//        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.itemSize = CGSize(width: (view.frame.width-50)/3, height: (view.frame.width-50)/3)
        let collection = UICollectionView(frame: CGRect(x: 10, y: 40, width: view.frame.width, height: view.frame.height),collectionViewLayout: layout)
        
        //加header
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        
        collection.backgroundColor = UIColor.white
        view.addSubview(collection)
        self.myCollectionView = collection
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(collectionCell.self, forCellWithReuseIdentifier: "cell")
        self.myCollectionView.register(collectionHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header")
        
//        self.myCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(self.myCollectionView)
//        NSLayoutConstraint.activate([
//            myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 10),
//            myCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
//        ])


    }

}


class collectionHeader: UICollectionReusableView{
    var titileLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.titileLabel = {
            let label = UILabel()
            label.backgroundColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        addSubview(titileLabel)
        NSLayoutConstraint.activate([
            self.titileLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.titileLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -2),
            self.titileLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
            self.titileLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2)
        ])
    }
}

class collectionCell: UICollectionViewCell{
    var cellView: UIView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.cellView = {
            let cell = UIView()
            cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
//            cell.backgroundColor = UIColor.yellow
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.layer.cornerRadius = 5
            return cell
        }()
        self.label = {
            let label = UILabel()
//            label.backgroundColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
        addSubview(cellView)
        cellView.addSubview(self.label)
        NSLayoutConstraint.activate([
            self.cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -2),
            self.cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
            self.cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2)
        ])
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.cellView.centerYAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.cellView.centerXAnchor)
        ])
    }
}

//let SCREEN_WIDTH:CGFloat = 300.0
//
//class SHomeHeader: UICollectionReusableView {
//    var titleLabel:UILabel?//title
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initView()
//    }
//    func initView(){
//        titleLabel = UILabel(frame: CGRect(x:0, y:0, width:SCREEN_WIDTH, height:50))
//        titleLabel?.backgroundColor = UIColor.red
//        self .addSubview(titleLabel!)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//class SHomeCell: UICollectionViewCell {
//
//    var titleLabel:UILabel?//title
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func initView(){
//        titleLabel = UILabel(frame: CGRect(x:0, y:0, width:100, height:(300 - 20)/3))
//        titleLabel?.layer.cornerRadius = 4
//        titleLabel?.layer.borderWidth = 0.5
//        titleLabel?.textAlignment = NSTextAlignment.center
//        titleLabel?.layoutMargins = UIEdgeInsets(top:0, left:0, bottom:0, right:0)
//
//        self .addSubview(titleLabel!)
//    }
//}
//
//class ViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//
//
//
//    var collectionView : UICollectionView?
//    var dataArr = NSMutableArray()//数据源
//    var headerArr = NSMutableArray()//分组标题
//    let headerHeight:CGFloat = 30
//    let cellHeight:CGFloat = (300 - 20)/3
//    let headerIdentifier:String = "headView"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initView()
//        initData()
//    }
//
//    func initView(){
//        let layout = UICollectionViewFlowLayout()
//        self.view.backgroundColor = UIColor.white
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
//        layout.minimumInteritemSpacing = 5; // this number could be anything <=5. Need it here because the default is 10.
//        layout.minimumLineSpacing = 4.0 //设置行间距
//        layout.itemSize = CGSize(width:(300 - 20)/3, height:(300 - 20)/3) // 20 is 2*5 for the 2 edges plus 2*5 for the spaces between the cells
//
//        collectionView = UICollectionView(frame: CGRect(x:0, y:0,  width:view.frame.width,height:view.frame.height), collectionViewLayout: layout)
//        //注册一个cell
//        collectionView!.register(SHomeCell.self, forCellWithReuseIdentifier:"cell")
//        collectionView?.delegate = self;
//        collectionView?.dataSource = self;
//        collectionView?.backgroundColor = UIColor.white
//        //设置每一个cell的宽高
//        self.view.addSubview(collectionView!)
//        //注册header
//        collectionView!.register(SHomeHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
//
//    }
//
//    func initData(){
//        initHeaderData()
//        initSelectionData()
//        self.collectionView?.reloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    //返回多少个组
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//
//        return headerArr.count
//    }
//
//    //返回多少个cell
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataArr.count
//    }
//
//    //返回自定义的cell
//    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! SHomeCell
//        let title = dataArr[indexPath.row]
//        cell.titleLabel?.text = title as? String
//        return cell
//
//    }
//
//    func initHeaderData() {
//
//        headerArr.add("header 1")
//        headerArr.add("header 2")
//        headerArr.add("header 3")
//
//    }
//
//    func initSelectionData() {
//
//        dataArr.add("selection 1")
//        dataArr.add("selection 2")
//        dataArr.add("selection 3")
//
//    }
//
//
//    //设置HeadView的宽高
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
//        return CGSize(width: 300, height: 100)
//    }
//
//    //返回自定义HeadView
//    private func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
//        var v = SHomeHeader()
//        if kind == UICollectionView.elementKindSectionHeader{
//            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath as IndexPath) as! SHomeHeader
//            let title:String = headerArr[indexPath.section] as! String
//            v.titleLabel?.text = title
//        }
//        return v
//    }
//
//    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
//        cell!.layer.cornerRadius = 4
//        cell?.backgroundColor = UIColor.yellow
//    }
//
//    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
//        cell!.layer.cornerRadius = 4
//        cell?.backgroundColor = UIColor.white
//    }
//
//}





