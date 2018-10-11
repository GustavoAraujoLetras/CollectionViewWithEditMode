//
//  MyTableViewAdapter.swift
//  CollectionViewWithEditMode
//
//  Created by Gustavo Araújo on 11/10/18.
//  Copyright © 2018 Letras. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewAdapterDelegate: NSObjectProtocol {
    func tableView(_ tableView: UITableView, withAdapter adapter: TableViewAdapter, didClickSong song: Song)
}

class TableViewAdapter: UITableView {

    var songs = [Song]()
    weak var adapterDelegate: TableViewAdapterDelegate?

}

extension TableViewAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as? SongCell else { fatalError() }
        let song = songs[indexPath.item]
        cell.song = song

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            songs.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

}
