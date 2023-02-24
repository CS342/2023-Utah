////
////  File.swift
////
////
////  Created by Emmy Thamakaison on 22/2/2566 BE.
////
//
//import Foundation
//import SwiftUI
//import UIKit
//import CareKit
//import CareKitUI
//import ResearchKit
//
//final class InsightsViewController:
//    OCKListViewController,
//    OCKFeaturedContentViewDelegate,
//    ORKTaskViewControllerDelegate {
//
//    let storeManager: OCKSynchronizedStoreManager
//
//    init(storeManager: OCKSynchronizedStoreManager) {
//        self.storeManager = storeManager
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        // A spacer view.
//        appendView(UIView(), animated: false)
//
////        let kneeModelView = OCKFeaturedContentView(imageOverlayStyle: .dark)
////        kneeModelView.delegate = self
////        kneeModelView.label.text = "About the meniscus"
////        kneeModelView.label.textColor = .systemBackground
////        kneeModelView.imageView.image = UIImage(named: "knee")
////        appendView(kneeModelView, animated: true)
//
//
//        let efsSeries = OCKDataSeriesConfiguration(
//            taskID: "efsSeries", //which task's data to plot
//            legendTitle: "Your Edmonton Frail Scale scores",
//            gradientStartColor: UIColor.systemBlue,
//            gradientEndColor: UIColor.systemBlue,
//            markerSize: 10,
//            eventAggregator: .custom({ events in
//                events
//                    .first?
//                    .answer(kind: Surveys.checkInSleepItemIdentifier)
//                ?? 0
//            })
//        )
//
//        let stepSeries = OCKDataSeriesConfiguration(
//            taskID: "stepSeries",
//            legendTitle: "Your week's step count",
//            gradientStartColor: #colorLiteral(red: 1, green: 0.462745098, blue: 0.368627451, alpha: 1),
//            gradientEndColor: #colorLiteral(red: 1, green: 0.462745098, blue: 0.368627451, alpha: 1),
//            markerSize: 10,
//            eventAggregator: .custom({ events in
//                events
//                    .first?
//                    .answer(kind: Surveys.checkInPainItemIdentifier)
//                ?? 0
//            })
//        )
//
//        let barChart = OCKCartesianChartViewController(
//            plotType: .bar,
//            selectedDate: Date(),
//            configurations: [efsSeries, stepSeries],
//            storeManager: storeManager
//        )
//
//        appendViewController(barChart, animated: false)
//
////        let rangeSeries = OCKDataSeriesConfiguration(
////            taskID: TaskIDs.rangeOfMotionCheck,
////            legendTitle: "Range of Motion (degrees)",
////            gradientStartColor: view.tintColor,
////            gradientEndColor: view.tintColor,
////            markerSize: 3,
////            eventAggregator: .custom({ events in
////                events
////                    .first?
////                    .answer(kind: #keyPath(ORKRangeOfMotionResult.range))
////                ?? 0
////            })
////        )
////
////        let scatterChart = OCKCartesianChartViewController(
////            plotType: .scatter,
////            selectedDate: Date(),
////            configurations: [rangeSeries],
////            storeManager: storeManager
////        )
//
////        appendViewController(scatterChart, animated: false)
//
//        // A spacer view.
//        appendView(UIView(), animated: false)
//    }
//
//    // MARK: OCKFeaturedContentViewDelegate
//
////    func didTapView(_ view: OCKFeaturedContentView) {
////
////        let humanModelTask = Surveys.kneeModel()
////
////        let taskViewController = ORKTaskViewController(
////            task: humanModelTask,
////            taskRun: nil
////        )
////
////        taskViewController.delegate = self
////
////        present(taskViewController, animated: true, completion: nil)
////    }
//
//    // MARK: ORKTaskViewControllerDelegate
//
//    func taskViewController(
//        _ taskViewController: ORKTaskViewController,
//        didFinishWith reason: ORKTaskViewControllerFinishReason,
//        error: Error?) {
//
//        taskViewController.dismiss(animated: true, completion: nil)
//    }
//}
