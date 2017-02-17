//*** Note : Difference between using
//**  UICollectionViewController &  UIViewController ***//

//  HellaCollectionViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaCollectionViewController: UICollectionViewController {

   // @IBOutlet weak var hellaCollectionView: UICollectionView!
    
    
    var fibonacciList:[Int] = []
    
    override func viewDidLoad() {
    // Do any additional setup after loading the view, typically from a nib.
//        hellaCollectionView.dataSource = self
//        hellaCollectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hellaCell", for: indexPath)
        findFibonacci(end: 100)
        
        //cell.backgroundColor = UIColor.purple
        
        if fibonacciList[indexPath.row] == 1 {
            cell.backgroundColor = UIColor.purple
            print("cell:\(indexPath.row)")
        } else {
            cell.backgroundColor = UIColor.yellow
        }
        
        return cell
    }
    
    
    func findFibonacci(end:Int) {
        var a = 0
        var b = 1
        fibonacciList.append(1)  //is fibo
        //   print(0)
        for i in 1...end {
            if a+b == i {
                fibonacciList.append(1)
                a = b
                b = i
                //print("\(i) ")
            } else {
                fibonacciList.append(0)
                
            }
            
        } //for
    }
    
    
}

