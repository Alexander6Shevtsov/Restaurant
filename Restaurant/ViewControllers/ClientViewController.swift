//
//  ClientViewController.swift
//  Restaurant
//
//  Created by Alexander Shevtsov on 02.09.2024.
//

import UIKit

// Официант
protocol KitchenViewControllerDelegate: AnyObject {
    func completeOrder()
}

// Клиет
final class ClientViewController: UIViewController {
    
    @IBOutlet private var clientStatusLabel: UILabel!
    @IBOutlet private var clientActionButton: UIButton!
    
    // Официант принимает заказ и идет на кухню
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kitchenVC = segue.destination as? KitchenViewController
        // Официант пришел на кухню за заказом конкретного клиента
        kitchenVC?.delegate = self
    }
    
    // Официант уточняет готов ли клиент сделать заказ
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        clientActionButton.titleLabel?.text == "Сделать заказ"
    }
    
    // Клиент подзывает официанта
    @IBAction private func clientActionButtonPressed() {
        if clientActionButton.titleLabel?.text == "Оплатить счёт" {
            clientStatusLabel.text = "Хочу есть!"
            clientActionButton.setTitle("Сделать заказ", for: .normal)
        } else {
            performSegue(withIdentifier: "openKitchenVC", sender: nil)
        }
    }
}

// MARK: - KitchenViewControllerDelegate
// Сегодня я буду вашим официантом
extension ClientViewController: KitchenViewControllerDelegate {
    // Передача заказа клиенту
    func completeOrder() {
        clientStatusLabel.text = "Спасибо!"
        clientActionButton.setTitle("Оплатить счёт", for: .normal)
    }
}
