//
//  CodeCell.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 11.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import ScalingCarousel

class CodeCell: ScalingCarouselCell {
    var mainImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        self.mainImageView = UIImageView(frame: mainView.bounds)
        mainView.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            mainImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            mainImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
