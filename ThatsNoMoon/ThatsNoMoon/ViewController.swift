//
//  ViewController.swift
//  ThatsNoMoon
//
//  Created by Chung, Myungyun on 7/7/18.
//  Copyright © 2018 Chung, Myungyun. All rights reserved.
//

import UIKit


class HomeWorld: Codable {
    let name: String
}


class ViewController: UIViewController, UITableViewDataSource {
    
    final let url = URL(string: "https://swapi.co/api/people/")
    private var results  = [Character]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
    }
    
    func downloadJson() {
        guard let downloadURL = url else { return } //ensuring that downloadable url exists, else return
        
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("error occured")
                return
            }
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                let downloadedResults = try decoder.decode(Results.self, from: data)
                self.results = downloadedResults.results
                
                DispatchQueue.main.async { //switches current thread to main thread
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error occurred after downloading of data")
            }
        }.resume() //continuous process
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell else {
            return UITableViewCell()
        }
        
       
        cell.nameLabel.text = "Name: " + results[indexPath.row].name
        
        let homeURL = results[indexPath.row].homeworld// else { return }
        URLSession.shared.dataTask(with: homeURL) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let planet = try decoder.decode(HomeWorld.self, from: data)
                DispatchQueue.main.async { //switches current thread to main thread
                    cell.homeLabel.text = "Home Planet: " + planet.name
                }
            } catch let err {
                print("error: ", err)
            }
        }.resume()
        
      
        
        
        
        return cell
    }
   
  
    
}



