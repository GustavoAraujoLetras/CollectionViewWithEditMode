//
//  ViewController.swift
//  CollectionViewWithEditMode
//
//  Created by Gustavo Araújo on 01/10/18.
//  Copyright © 2018 Letras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
//    @IBOutlet private weak var collectionView: UICollectionView!

    private var adapter = TableViewAdapter()
    private var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()

        songs = [Song("Hello", by: "Adele"),
                 Song("Numb", by: "Linkin Park"),
                 Song("Given Up", by: "Linkin Park"),
                 Song("Don't Stay", by: "Linkin Park"),
                 Song("Faint", by: "Linkin Park"),
                 Song("Thunderclouds", by: "LSD"),
                 Song("Chandelier", by: "Sia"),
                 Song("Genius", by: "LSD"),
                 Song("Elastic Heart", by: "Sia"),
                 Song("Cheap Thrills", by: "Sia"),
                 Song("9th Symphony", by: "Beethoven"),
                 Song("Panama", by: "Van Halen"),
                 Song("Rap God", by: "Eminem"),
                 Song("Mocking Bird", by: "Eminem"),
                 Song("Real Slim Shady", by: "Eminem"),
                 Song("Without Me", by: "Eminem"),
                 Song("Stan", by: "Eminem"),
                 Song("Need A Doctor", by: "Eminem, Dr. Dree, Skylar Grey"),
                 Song("Killshot", by: "Eminem")]

        songs.sort(by:{ songA, songB in songA.name > songB.name })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        adapter.adapterDelegate = self
        adapter.songs = songs
//        adapter.registerCells(tableView: tableView)

//        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.reloadData()
    }
}

extension ViewController: TableViewAdapterDelegate {
    func tableView(_ tableView: UITableView, withAdapter adapter: TableViewAdapter, didClickSong song: Song) {
        print("Selected song \(song.name) by \(song.artist)")
    }
}
