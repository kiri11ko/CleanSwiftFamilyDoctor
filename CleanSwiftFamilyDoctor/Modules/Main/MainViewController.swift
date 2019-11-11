//
//  MainViewController.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import UIKit
import ScalingCarousel

protocol IMainViewController: class {
	var router: IMainRouter? { get set }
    func updateCarusel(count: Int)
    func setLabelData(title: String, description: String)
}

class MainViewController: UIViewController {
	var interactor: IMainInteractor?
	var router: IMainRouter?
    fileprivate var scalingCarousel: ScalingCarouselView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var descriptionPills: UILabel!
    @IBOutlet weak var titlePills: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getCach()
        interactor?.networkLoadStart()
        addCarousel()
        pageControl.numberOfPages = interactor?.pillsData?.pills?.count ?? 0
        pageControl.currentPage = 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
         if scalingCarousel != nil {
            scalingCarousel.deviceRotated()
         }
    }
    
    @IBAction func refreshPillsData(_ sender: Any) {
        interactor?.networkLoadStart()
    }
    
    @IBAction func nextPillsAction(_ sender: Any) {
        guard let count = interactor?.pillsData?.pills?.count else {return}
        let possition = (count - pageControl.currentPage) == 1  ? 0 :  pageControl.currentPage + 1
        let indexPath = IndexPath(item:  possition, section: 0)
        scalingCarousel.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 50)
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .white
        scalingCarousel.showsHorizontalScrollIndicator = false
        scalingCarousel.register(CodeCell.self, forCellWithReuseIdentifier: "cell")
        
        backView.addSubview(scalingCarousel)
        
        NSLayoutConstraint.activate([
                   scalingCarousel.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
                   scalingCarousel.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
                   scalingCarousel.topAnchor.constraint(equalTo: backView.topAnchor),
                   scalingCarousel.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
                   ])

    }
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor?.pillsData?.pills?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? CodeCell {
            scalingCell.mainView.backgroundColor = .lightGray
            interactor!.getImage(row: indexPath.row, image: scalingCell.mainImageView )
        }
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }

        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let currentCenterIndex = scalingCarousel.currentCenterCellIndex?.row else { return }
        pageControl.currentPage = currentCenterIndex
        interactor!.displayPillsData(number: currentCenterIndex)
    }
}

extension MainViewController: IMainViewController {
    
    func setLabelData(title: String, description: String) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.titlePills.alpha = 0
            self.descriptionPills.alpha = 0
            self.titlePills.text = title
            self.descriptionPills.text = description
            self.titlePills.alpha = 1.0
            self.descriptionPills.alpha = 1.0
        }, completion: nil)
        
    }
    
    func updateCarusel(count: Int) {
        pageControl.numberOfPages = count
        scalingCarousel.reloadData()
    }

    
	// do someting...
}

extension MainViewController {
	// do someting...
}

extension MainViewController {
	// do someting...
}
