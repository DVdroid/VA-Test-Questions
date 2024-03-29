//
//  ViewController.swift
//  VA-Test-Questions
//
//  Created by Vikash Anand on 26/04/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //let inputArray = [-3, -1, 4]
    //let inputArray = [1, 2, 3, 4, 5]
    let twoDArray = [[1, -1, 0, -9, -2, -2],
                     [-2, -1, -6, -8, -2, -5],
                     [-1, -1, -1, -2, -3, -4],
                     [-1, -9, -2, -4, -4, -5],
                     [-7, -3, -3, -2, -9, -9],
                     [-1, -3, -1, -2, -4, -5]]

    let anotherTwoDArray: [[Int]] = [[1, 345255357, 205970905],
                                     [1 ,570256166 ,75865401],
                                     [1 ,94777800 ,645102173],
                                     [1 ,227496730 ,16649450],
                                     [1 ,82987157 ,486734305],
                                     [1 ,917920354 ,757848208],
                                     [1 ,61379773 ,817694251],
                                     [1 ,330547128 ,112869154],
                                     [1 ,328743001 ,855677723],
                                     [1 ,407951306 ,669798718],
                                     [1 ,21506172 ,676980108],
                                     [1 ,49911390 ,342109400],
                                     [1 ,980306253 ,305632965],
                                     [2 ,736380701 ,402184046],
                                     [2 ,798108301 ,416334323],
                                     [1 ,254839279 ,1370035],
                                     [1 ,109701362 ,2800586],
                                     [1 ,374257441 ,165208824],
                                     [1 ,624259835 ,477431250],
                                     [1 ,629066664 ,454406245],
                                     [1 ,135821145 ,763845832],
                                     [1 ,480298791 ,138234911],
                                     [1 ,553575409 ,835718837],
                                     [1 ,13022848 ,624652920],
                                     [1 ,974893519 ,882630870],
                                     [1 ,137832930 ,216177975],
                                     [1 ,453349691 ,969255659],
                                     [1 ,138396076 ,91038209],
                                     [1 ,699822497 ,941751038],
                                     [1 ,116800806 ,64071662],
                                     [1 ,815273934 ,8835809],
                                     [1 ,658534867 ,657771609],
                                     [1 ,183760807 ,179377441],
                                     [1 ,93984556 ,636425656],
                                     [1 ,231506463 ,836238924],
                                     [1 ,214074594 ,709571211],
                                     [1 ,649641434 ,509698468],
                                     [2 ,523656673 ,709717705],
                                     [2 ,261443586 ,330808140],
                                     [1 ,75924023 ,449768243],
                                     [1 ,849537714 ,354568873],
                                     [2 ,641743742 ,124196560],
                                     [1 ,19829224 ,995759639],
                                     [1 ,244389335 ,108315212],
                                     [1 ,877758467 ,421383626],
                                     [1 ,573278148 ,474192994],
                                     [2 ,561031511 ,448889978],
                                     [1 ,773294404 ,980994962],
                                     [2 ,33088709 ,716646168],
                                     [1 ,760927835 ,441983538],
                                     [1 ,273540687 ,783321829],
                                     [1 ,5933845 ,384358662],
                                     [1 ,543628702 ,372160176],
                                     [2 ,136400466 ,910559291],
                                     [2 ,546568738 ,393221347],
                                     [1 ,812227065 ,694221123],
                                     [1 ,311065574 ,103905420],
                                     [2 ,571344361 ,185289590],
                                     [1 ,99638520 ,173318136],
                                     [1 ,854060080 ,407068012],
                                     [2 ,980658213 ,778573744],
                                     [2 ,412539660 ,476853104],
                                     [1 ,530145366 ,36493537],
                                     [1 ,604875364 ,100141497],
                                     [2 ,650812104 ,64817757],
                                     [1 ,141060009 ,766603553],
                                     [1 ,598398952 ,418245941],
                                     [1 ,262344011 ,431865586],
                                     [2 ,56413893 ,546484833],
                                     [1 ,400736735 ,673588153],
                                     [1 ,642955232 ,803851098],
                                     [1 ,917782037 ,935143105],
                                     [1 ,658284524 ,745224102],
                                     [1 ,103202288 ,501551287],
                                     [1 ,162144918 ,12888783],
                                     [1 ,16486753 ,67467208],
                                     [1 ,671120703 ,941541277],
                                     [1 ,47399694 ,77707668],
                                     [1 ,122011395 ,946116527],
                                     [1 ,924363862 ,886726236],
                                     [2 ,657761235 ,540240467],
                                     [1 ,203175991 ,279882007],
                                     [2 ,304620923 ,162838413],
                                     [1 ,440453449 ,117964712],
                                     [2 ,941868853 ,887850334],
                                     [1 ,293198923 ,466812643],
                                     [1 ,461688477 ,532794906],
                                     [1 ,315016797 ,733095902],
                                     [1 ,265008751 ,913972757],
                                     [1 ,887405255 ,139170948],
                                     [2 ,754223230 ,426836947],
                                     [1 ,945967814 ,852589735],
                                     [1 ,168866283 ,309720694],
                                     [1 ,373861145 ,94596540],
                                     [2 ,984122495 ,20702849],
                                     [2 ,233835636 ,180460242],
                                     [1 ,172787631 ,643823473],
                                     [1 ,273611372 ,616819555],
                                     [1 ,196104599 ,690080895],
                                     [1 ,527554061 ,434103342]]

    let oneMoreTwoDArray: [[Int]] =
        [[0,0,0, 0, 0,0,0,0,0, 0],
         [3,3,3, 3, 3,0,0,0,0, 0],
         [3,3,3,10,10,7,7,7,0, 0],
         [3,3,3,10,10,8,8,8,1, 0]]

    let arrayManipulationQuery = [[29, 40, 787],
                                  [9 ,26 ,219],
                                  [21 ,31 ,214],
                                  [8 ,22 ,719],
                                  [15 ,23 ,102],
                                  [11 ,24 ,83],
                                  [14 ,22 ,321],
                                  [5 ,22 ,300],
                                  [11 ,30 ,832],
                                  [5 ,25 ,29],
                                  [16 ,24 ,577],
                                  [3 ,10 ,905],
                                  [15 ,22 ,335],
                                  [29 ,35 ,254],
                                  [9 ,20 ,20],
                                  [33 ,34 ,351],
                                  [30 ,38 ,564],
                                  [11 ,31 ,969],
                                  [3 ,32 ,11],
                                  [29 ,35 ,267],
                                  [4 ,24 ,531],
                                  [1 ,38 ,892],
                                  [12 ,18 ,825],
                                  [25 ,32 ,99],
                                  [3 ,39 ,107],
                                  [12 ,37 ,131],
                                  [3 ,26 ,640],
                                  [8 ,39 ,483],
                                  [8 ,11 ,194],
                                  [12 ,37 ,502]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //print(MaxMinSubsetDiff.maxMinSubsetDiff())
        //let elementCount = inputArray.count
        //print(MaxMinSubsetDiff.printSubSequence(for: inputArray, with: elementCount, from: 0, to: 0))

        //print(MaxSum_HourGlass.maxSumAmongAllHourGlasses(in: twoDArray))

        //        let duration1 = RuntimeCalculator.duration {
        //            print(DynamicArray.dynamicArray(n: 2, queries: anotherTwoDArray))
        //        }
        //        let duration2 = RuntimeCalculator.duration {
        //            print(DynamicArray.dynamicArrayUsingRecursion(n: 2, queries: anotherTwoDArray))
        //        }
        //        print(duration1, duration2)
        //        print(RuntimeCalculator.compare(timeInterval1: duration1, timeInterval2: duration2))

        //print(ArrayManipulation.arrayManipulation(n: 40, queries: arrayManipulationQuery))
        //print(ArrayPairs.findArrayPairs(in: [1, 1, 2, 4, 2]))
        //print(SockMerchant.findPairCount(in: [10 ,20 ,20 ,10 ,10 ,30 ,50 ,10 ,20]))
        //print(JumpingOnTheCloud.jumpingOnClouds(c: [0, 0, 0, 0 ,1, 0]))
        //print(RepeatedString.repeatedString(s: "aba", n: 10))
        //print(ArrayRotation.rotateLeft(a: [1, 2, 3, 4, 5], d: 3))
        //print(ArrayRotation.rotateLeftWithRecursion(a:  [1, 2, 3, 4, 5], d: 3))
        //print(NewYearChaos.minimumBribes(q: [1, 2, 5, 3, 7, 8, 6, 4]))
        //print(Ransome_Note.checkMagazine(magazine: ["give" ,"me" ,"one" ,"grand" ,"today" ,"night"],
        //note: ["give" ,"me" ,"one" ,"grand" ,"today"]))
        //print(Two_Strings.twoStrings(s1: "hello", s2: "world"))
        //print(SherlockAnagrams.sherlockAndAnagrams(s: "kkkk"))
        //print(Min_Swaps.minimumSwaps(arr: [1, 3, 5, 2, 4, 6, 7]))

        /*
         var cost = [0, 1, 2, 3, 4, 5]
         var string = "abccbd"
         print(Codility.solution(&string, &cost))*/

        //print(CountTriplets.countTriplets(arr: [1, 3, 9, 9, 27, 81], r: 3))
        //print(MarkAndToys.maximumToys(prices: [3, 7, 2 ,9, 4], k: 15))
        //print(FraudulentActivityNotification.activityNotifications(expenditure: [1, 2, 3, 4, 4], d: 4))
        //print(FraudulentActivityNotification.activityNotifications(expenditure: [10, 20, 30, 40, 50], d: 3))
        /*print(MinBuildingPaintingCost.findMinPaintingCost(paintingCost: [[100, 20], [30, 59], [71, 81], [9, 200]],
         forBuildings: [0, 0, 0, 2],
         availableColorCount: 2,
         clusterCount: 1))*/

        /*
         Given two string, write a method to find if all the characters in the first string are present in the second string. Return true if present else false.

         note = 'Hi, everyone'
         book = 'Hello, It's Karthikeyan from Smartserv'

         func checkIfChars(of note: String, isAvailableIn book: String) -> Bool {
         return false
         }
         */


        /*let block1 = RuntimeCalculator.duration {
         print(StringHasAllSubStringChars.checkChars(fromString: "Hi, everyone",
         in: "Hello, It's Karthikeyan from Smartserv"))
         }

         let block2 = RuntimeCalculator.duration {
         print(StringHasAllSubStringChars.checkChars_new(fromString: "Hi, everyone",
         in: "Hello, It's Karthikeyan from Smartserv"))
         }
         print(RuntimeCalculator.compare(timeInterval1: block1, timeInterval2: block2))*/

        //var queue = QueueArray<String>()
        //let _ = queue.enqueue("Vikash")
        //let _ = queue.enqueue("Anand")
        //let _ = queue.enqueue("VA")
        //print(queue)
        //let _ = queue.dequeue()
        //print(queue)
        //print(String(describing:queue.peek))


        //let turnstile = TurnstileProblem()
        //print(turnstile.getTimes(time: [0, 0, 1, 5], direction: [0, 1, 1, 0]))
        //print(turnstile.getTimes(time: [0, 1, 1, 3, 3], direction: [0, 1, 0, 0, 1]))
        //print(turnstile.getTimes(time: [3, 3, 3, 4, 4, 5, 6, 6, 7, 8], direction: [1, 1, 0, 1, 0, 0, 0, 1, 0, 0]))


        //let maxSum = MaxSumOfTwoNumInArray()
        //print(maxSum.findMaxSum(numbers: [5, 9, 7, 11]))

        /*
         let henEgg = Egg<Hen>.init(createFowl: {
         return Hen()
         })

         //This will work as egg is not hatched yet
         do {
         let hen = try henEgg.hatch()
         print(String(describing:hen.identifier))
         } catch let error {
         print(error.localizedDescription)
         }

         //This will throw error as same egg can't be hatched
         do {
         let _ = try henEgg.hatch()
         } catch let error {
         print(error.localizedDescription)
         }


         let dinosaurEgg = Egg<Dinosaur>.init(createFowl: {
         return Dinosaur()
         })

         //This will work as egg is not hatched yet
         do {
         let dinosaur = try dinosaurEgg.hatch()
         print(String(describing:dinosaur.identifier))
         } catch let error {
         print(error.localizedDescription)
         }

         //This will throw error as same egg can't be hatched
         do {
         let _ = try dinosaurEgg.hatch()
         } catch let error {
         print(error.localizedDescription)
         }
         */


        /*
        do {
            let stocks = try JSONReader().read()
            let stockPriceObj = StockPrice(stocks)
            let matchingStocks = try stockPriceObj.openAndClosePrices(firstDate: "1-January-2000", lastDate: "22-February-2000", weekday: "Monday")
            for stock in matchingStocks {
                print("\(stock.date) \(stock.open) \(stock.close)")
            }
        } catch StockError.NoStockError {
            print("Stock not found.")
        } catch StockError.InvalidParameterError {
            print("Invalid parameter.")
        } catch StockError.JSONFileNotFoundError {
            print("data.json file not found.")
        } catch StockError.InvalidJSONFormatError {
            print("Couldn't parse data.json file.")
        } catch let error {
            print(error.localizedDescription)
        }

        let string = "1-January-2000,22-February-2000,Monday,"
        let newStr = string.prefix(string.count - 1)
        let components = newStr.components(separatedBy: ",")
        print("\(components[0]) \(components[1]) \(components[2])")*/

        //let numbers = [3, 7, 1, 2, 8, 4, 10]
        //let result = 20
        //Logger.logResult(for: SumOfd3Integers.isSumOfAny3(in: numbers, equals: result))

        let intervals = [(10,12), (12,15)]
        print(MergeOverlapIntervals.merge(intervals: intervals))
    }
}

enum Logger {
    static func logResult(for status: Bool) {
        if status == true {
            print("Passed ✅")
        } else {
            print("Failed ❌")
        }
    }
}
