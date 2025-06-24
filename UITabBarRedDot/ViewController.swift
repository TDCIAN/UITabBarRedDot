//
//  ViewController.swift
//  UITabBarRedDot
//
//  Created by 김정민 on 6/24/25.
//

import UIKit

class ViewController: UITabBarController {

    private let starBadgeViewController: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemYellow
        vc.tabBarItem.image = UIImage(systemName: "star")?.withBadge(iconColor: .black)
        vc.tabBarItem.selectedImage = UIImage(systemName: "star.fill")?.withBadge(iconColor: .blue, badgeColor: .clear)
        return vc
    }()
    
    private let heartBadgeViewController: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemYellow
        vc.tabBarItem.image = UIImage(systemName: "heart")?.withBadge(iconColor: .black)
        vc.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")?.withBadge(iconColor: .blue, badgeColor: .clear)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewControllers = [starBadgeViewController, heartBadgeViewController]
    }


}

//extension UIImage {
//    func withBadge(iconColor: UIColor, badgeColor: UIColor = .red) -> UIImage {
//        let render = UIGraphicsImageRenderer(size: size)
//        
//        return render.image { _ in
//            let iconTintImage = withRenderingMode(.alwaysTemplate)
//            iconColor.setFill()
//            iconTintImage.draw(at: .zero)
//            
//            let badgeSize = CGSize(width: 4, height: 8)
//            let badgeOrigin = CGPoint(
////                x: size.width - badgeSize.width,
////                x: 0,
//                x: size.width,
//                y: 0
//            )
//            let badgeRect = CGRect(origin: badgeOrigin, size: badgeSize)
//            let badgePath = UIBezierPath(ovalIn: badgeRect)
//            badgeColor.setFill()
//            badgePath.fill()
//        }
//        .withRenderingMode(.alwaysOriginal)
//    }
//}

extension UIImage {
    func withBadge(iconColor: UIColor, badgeColor: UIColor = .red) -> UIImage {
        let badgeSize = CGSize(width: 8, height: 8)
        // 오른쪽 위에 badge가 나오도록 캔버스 크기 확장
        let newSize = CGSize(
            width: size.width + badgeSize.width,
            height: size.height + badgeSize.height
        )
        let render = UIGraphicsImageRenderer(size: newSize)
        
        return render.image { _ in
            // 원본 이미지는 좌측 하단에 그리기
            let iconTintImage = withRenderingMode(.alwaysTemplate)
            iconColor.setFill()
            iconTintImage.draw(at: CGPoint(x: 0, y: badgeSize.height / 2))
            
            // badge는 오른쪽 위에 그리기
            let badgeOrigin = CGPoint(
                x: size.width,
                y: 0
            )
            let badgeRect = CGRect(origin: badgeOrigin, size: badgeSize)
            let badgePath = UIBezierPath(ovalIn: badgeRect)
            badgeColor.setFill()
            badgePath.fill()
        }
        .withRenderingMode(.alwaysOriginal)
    }
}
