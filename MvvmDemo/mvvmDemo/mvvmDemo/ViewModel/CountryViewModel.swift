//
//  EmployeeViewModel.swift
//  mvvmDemo
//
//  Created by mac on 18/07/21.
//

import Foundation


class CountryViewModel: NSObject{
    
    private var apiService : APIServices!
    private(set) var countries: Countries! {
        didSet{
            self.bindCountriesModelToCOntroller()
        }
    }
    
    ///bind values to controller using closure
    var bindCountriesModelToCOntroller: (() -> ()) = { }
    
    override init() {
        super.init()
        self.apiService = APIServices()
        self.getCountriesData()
    }
    
    /// call get counties API
    func getCountriesData() {
        self.apiService.apiToGetCountriesData { countries in
            self.countries = countries
            print(self.countries ?? [])
        }
    }
}
