//
//  ListViewController.swift
//  CurrencyConverterApp
//
//  Created by 초코크림 on 2023/05/03.
//

import UIKit

class ListViewController: UIViewController{
    @IBOutlet weak var inputUsdValue: UITextField!
    @IBOutlet weak var currencyTableView: UITableView!
    var rates: [(String, Double)]?
    var usdValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputUsdValue.delegate = self
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        
        let currencyCellNib = UINib(nibName: "CurrencyCell", bundle: nil)
        currencyTableView.register(currencyCellNib, forCellReuseIdentifier: "CurrencyCell")
        
        self.navigationItem.title = "Currency Converter Table"
        
        fetchJson()
    }
    
    func fetchJson(){
        NetworkLayer.fetchJson { model in
            self.rates = model.rates?.sorted{$0.key < $1.key}

            DispatchQueue.main.async{
                self.currencyTableView.reloadData()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        usdValue = Double(textField.text ?? "")
        currencyTableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rates?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        let changedValue = String(format: "%.2f", (self.rates?[indexPath.row].1 ?? 0) * (usdValue ?? 0))
        
        cell.leftLabel.text = self.rates?[indexPath.row].0
        cell.rightLabel.text = changedValue
        
        return cell
    }
}
