//
//  KitchenViewController.swift
//  Restaurant
//
//  Created by Alexander Shevtsov on 02.09.2024.
//

import UIKit

// Кухня
final class KitchenViewController: UIViewController {
    
    // Назначаем официанта, который должен забрать заказ
    unowned var delegate: KitchenViewControllerDelegate!
    
    @IBAction private func completeOrderButtonPressed() {
        // Передача заказа официанту
        delegate.completeOrder()
        dismiss(animated: true)
    }
}
