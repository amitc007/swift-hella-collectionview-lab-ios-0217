//*** Note : Difference between using
//**  UICollectionViewController &  UIViewController ***//
//** Change storyboard  to use this class
//
//  HellaViewController.swift
//  HellaCollectionCells
//
//  Created by ac on 2/16/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit
//**Note We add UICollectionViewDelegate & ViewDataSource
class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var hellaCollectionView: UICollectionView!   //create variable for CollectionView as we need to define delegate & dataSource ViewController
    
    
    var fibonacciList:[Int] = []   //fibinacci numbers list

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hellaCollectionView.delegate = self    // add delegate for collectionView as it is on top of ViewController
        hellaCollectionView.dataSource = self  // "   "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hellaCell2", for: indexPath)
        
        findFibonacci(end: 100)  //get list
        
        //cell.backgroundColor = UIColor.purple
        
        if fibonacciList[indexPath.row] == 1 {
            cell.backgroundColor = UIColor.purple
            print("fib cell:\(indexPath.row)")
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
  

    //send data to another screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cellTapped = hellaCollectionView.indexPath(for: sender as! UICollectionViewCell)
        
        let destVC = segue.destination as? HellaDetailViewController
        destVC?.hellaText = cellTapped?.row.description
        if fibonacciList[(cellTapped?.row)!] == 1 {
            destVC?.color = UIColor.purple
        } else {
            destVC?.color = UIColor.yellow
        }
        
        print("cellTapped:\(cellTapped!)")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

