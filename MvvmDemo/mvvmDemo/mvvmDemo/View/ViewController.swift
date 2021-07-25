//
//  ViewController.swift
//  mvvmDemo
//
//  Created by mac on 18/07/21.
//

import UIKit

class ViewController: UIViewController {

    private var countryVM: CountryViewModel!
    @IBOutlet weak var tblCountries: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.callViewModelForUIUpdate()
    }
    
    /// initiate view model here along with inital UI setup
    func callViewModelForUIUpdate() {
        self.countryVM = CountryViewModel()
        self.countryVM.bindCountriesModelToCOntroller = {
            self.updateTheTableViews()
        }
    }
    
    
    /// Updatel UI when the Closure gets called
    func updateTheTableViews(){
        self.tblCountries.reloadData()
    }
    
}



// MARK:- Tablewview delegates
extension ViewController:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let country = self.countryVM.countries{
            return country.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let data = self.countryVM.countries[indexPath.row]
        cell?.textLabel?.text = data.country
        return cell ?? UITableViewCell()
    }
    
}

