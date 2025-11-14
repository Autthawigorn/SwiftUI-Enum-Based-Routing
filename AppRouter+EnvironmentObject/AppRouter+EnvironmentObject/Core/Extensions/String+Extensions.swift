//
//  String+Extensions.swift
//  Catendar
//
//  Created by Autthawigorn on 6/10/2567 BE.
//
import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
