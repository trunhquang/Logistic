//
//  CreateNewParcelViewController.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

class CreateNewParcelViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var listItems: [CreateNewParcelModel]!
    
    private lazy var header: CreateNewParceHeaderView = {
        let view = CreateNewParceHeaderView.loadNib()
        view.frame = CGRect(x: 0, y: 0, w: Screen.WIDTH,h: Screen.WIDTH)
        return view
    }()
    private lazy var footer: CreateNewParcelFooterView = {
        let view = CreateNewParcelFooterView.loadNib()
        view.frame = CGRect(x: 0, y: 0, w: Screen.WIDTH,h: 70)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initListItem()
        configUI()
    }
}

//MARK: - UITableViewDataSource_TableViewDelegate
extension CreateNewParcelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if listItems[indexPath.row].type == .textView {
            let cell = tableView.dequeueCell(ofType: CreateParcelTypeTextViewTableViewCell.self, indexPath: indexPath)
            cell.model = listItems[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueCell(ofType: CreateParcelTypeTextFieldTableViewCell.self, indexPath: indexPath)
        cell.model = listItems[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
}
extension CreateNewParcelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listItems[indexPath.row].type == .textView {
            return 70
        }
        return 40
    }
}

//MARK: - CreateNewParceHeaderViewDelegate
extension CreateNewParcelViewController: CreateNewParceHeaderViewDelegate {
    func didSelectButtonCaptureImage() {
        Util.showToast(message: "Chỗ này sẽ làm tính năng chụp hình gói hàng up lên server")
    }
}

//MARK: - CreateNewParceHeaderViewDelegate
extension CreateNewParcelViewController: CreateNewParcelFooterViewDelegate {
    func didSelectButtonCreateNew() {
        Util.showToast(message: "Gọi API tạo mới, hiện tại thiết kế firebase")
    }
    
}

//MARK: - Private method
extension CreateNewParcelViewController{
    private func configUI(){
        title = "Tạo mới đơn hàng"
        navigationItem.leftBarButtonItem = BackBarButton()
        configTableView()
    }
    private func configTableView(){
        tableView.separatorStyle = .none
        tableView.registerCellByNibs(strings: [XibIdentify.Sender.CreateParcelTypeTextFieldTableViewCell,
                                               XibIdentify.Sender.CreateParcelTypeTextViewTableViewCell])
        tableView.tableHeaderView = header
        header.delegate = self
        tableView.tableFooterView = footer
        footer.delegate = self
    }
    private func initListItem(){
        listItems = [CreateNewParcelModel]()
        let parcelName = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "Tên gói hàng", validMessageError: "Tên gói hàng không thể rỗng", isValid: false)
        listItems.append(parcelName)
        let senderName = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "Tên người gửi", validMessageError: "Tên người gửi không thể rỗng", isValid: false)
        listItems.append(senderName)
        let receiveName = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "Tên người nhận", validMessageError: "Tên người nhận không thể rỗng", isValid: false)
        listItems.append(receiveName)
        let senderPhone = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "SDT người gửi", validMessageError: "Số điện thoại người gửi thể rỗng", isValid: false)
        listItems.append(senderPhone)
        let receivePhone = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "SDT người nhận", validMessageError: "Số điện thoại người nhận không thể rỗng", isValid: false)
        listItems.append(receivePhone)
        let senderMail = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "Email người gửi", validMessageError: "Email người gửi không thể rỗng", isValid: false)
        listItems.append(senderMail)
        let reveiveMail = CreateNewParcelModel(imageNAme: "avatar_white", type: .textField, placeHodelText: "Email người nhận", validMessageError: "Email người nhận không thể rỗng", isValid: false)
        listItems.append(reveiveMail)
        let des = CreateNewParcelModel(imageNAme: "avatar_white", type: .textView, placeHodelText: "Mô tả gói hàng", validMessageError: "Mô tả gói hàng không thể rỗng", isValid: false)
        listItems.append(des)
        let notes = CreateNewParcelModel(imageNAme: "avatar_white", type: .textView, placeHodelText: "Một số lưu ý khi giao hàng(thời gian giao hàng...)", validMessageError: "", isValid: false)
        listItems.append(notes)
        let addressReceive = CreateNewParcelModel(imageNAme: "avatar_white", type: .textView, placeHodelText: "Địa chỉ người nhận", validMessageError: "Địa chỉ người nhận không thể rỗng", isValid: false)
        listItems.append(addressReceive)
    }
}
