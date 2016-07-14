//
//  AllTheGlobals.swift
//  Checkout
//
//  Created by Stephen Flores on 11/15/15.
//  Copyright © 2015 Stephen Flores. All rights reserved.
//

/* ***** To Do:
Add variables to handle Core Data model (just a Double)
*********/

import Foundation
import UIKit

// *** User Default tax rate
var userDefaultTaxRate = 8.8
//var


// Rates
// Can set default rate by zipCode, i.e. defaultRate = zipDictionary[85395]
let asuRate = 0.081
let goodyearRate = 0.088
var currentRate = 0.081

// Strings
var priceListString =   "Items: \n" +
                        "First one \n" +
                        "Second one \n";


// values
var totalCost = 0.0
var checkoutCost = 0.0
var currentCost = 0.0
var itemCount = 0
var subtotal = 0.0
var taxAdded = 0.0


// Array
var priceArray: [Double] = []



/****** All the ZIP codes and their rates ******/
// Add more zips and rates as necessary
let zipDictionary = [
    85001:	0.083,
    85002:	0.083,
    85003:	0.083,
    85004:	0.083,
    85005:	0.083,
    85006:	0.083,
    85007:	0.083,
    85008:	0.083,
    85009:	0.083,
    85010:	0.083,
    85011:	0.083,
    85012:	0.083,
    85013:	0.083,
    85014:	0.083,
    85015:	0.083,
    85016:	0.083,
    85017:	0.083,
    85018:	0.083,
    85019:	0.083,
    85020:	0.083,
    85021:	0.083,
    85022:	0.083,
    85023:	0.083,
    85024:	0.083,
    85025:	0.083,
    85026:	0.083,
    85027:	0.083,
    85028:	0.083,
    85029:	0.083,
    85030:	0.083,
    85031:	0.083,
    85032:	0.083,
    85033:	0.083,
    85034:	0.083,
    85035:	0.083,
    85036:	0.083,
    85037:	0.083,
    85039:	0.063,
    85040:	0.083,
    85041:	0.083,
    85042:	0.083,
    85043:	0.083,
    85044:	0.083,
    85045:	0.083,
    85046:	0.083,
    85048:	0.083,
    85050:	0.083,
    85051:	0.083,
    85053:	0.083,
    85054:	0.083,
    85060:	0.083,
    85061:	0.083,
    85063:	0.083,
    85064:	0.083,
    85065:	0.083,
    85066:	0.083,
    85067:	0.083,
    85068:	0.083,
    85069:	0.083,
    85070:	0.083,
    85071:	0.083,
    85073:	0.063,
    85074:	0.083,
    85076:	0.083,
    85078:	0.083,
    85079:	0.083,
    85080:	0.083,
    85082:	0.083,
    85083:	0.083,
    85085:	0.083,
    85086:	0.063,
    85087:	0.063,
    85097:	0.083,
    85098:	0.083,
    85117:	0.091,
    85118:	0.067,
    85119:	0.091,
    85120:	0.091,
    85121:	0.087,
    85122:	0.087,
    85123:	0.067,
    85127:	0.0855,
    85128:	0.097,
    85130:	0.087,
    85131:	0.097,
    85132:	0.067,
    85135:	0.096,
    85137:	0.067,
    85138:	0.087,
    85139:	0.067,
    85140:	0.067,
    85141:	0.067,
    85142:	0.0855,
    85143:	0.067,
    85145:	0.067,
    85147:	0.067,
    85172:	0.067,
    85173:	0.107,
    85178:	0.091,
    85191:	0.067,
    85192:	0.067,
    85193:	0.067,
    85194:	0.067,
    85201:	0.0805,
    85202:	0.0805,
    85203:	0.0805,
    85204:	0.0805,
    85205:	0.0805,
    85206:	0.0805,
    85207:	0.0805,
    85208:	0.0805,
    85209:	0.0805,
    85210:	0.0805,
    85211:	0.0805,
    85212:	0.0805,
    85213:	0.0805,
    85214:	0.0805,
    85215:	0.0805,
    85216:	0.0805,
    85224:	0.078,
    85225:	0.078,
    85226:	0.078,
    85233:	0.078,
    85234:	0.078,
    85236:	0.078,
    85244:	0.078,
    85246:	0.078,
    85248:	0.078,
    85249:	0.078,
    85250:	0.0795,
    85251:	0.0795,
    85252:	0.0795,
    85253:	0.083,
    85255:	0.0795,
    85256:	0.0795,
    85257:	0.0795,
    85258:	0.0795,
    85259:	0.0795,
    85260:	0.0795,
    85261:	0.0795,
    85262:	0.0795,
    85263:	0.063,
    85264:	0.063,
    85266:	0.0795,
    85267:	0.0795,
    85268:	0.089,
    85269:	0.089,
    85271:	0.0795,
    85274:	0.0805,
    85275:	0.0805,
    85277:	0.0805,
    85280:	0.081,
    85281:	0.081,
    85282:	0.081,
    85283:	0.081,
    85284:	0.081,
    85285:	0.081,
    85286:	0.078,
    85287:	0.081,
    85295:	0.078,
    85296:	0.078,
    85297:	0.078,
    85298:	0.078,
    85299:	0.078,
    85301:	0.092,
    85302:	0.092,
    85303:	0.092,
    85304:	0.092,
    85305:	0.092,
    85306:	0.092,
    85307:	0.092,
    85308:	0.092,
    85309:	0.092,
    85310:	0.083,
    85311:	0.092,
    85312:	0.092,
    85318:	0.092,
    85320:	0.063,
    85321:	0.061,
    85322:	0.063,
    85323:	0.088,
    85324:	0.0635,
    85325:	0.076,
    85326:	0.093,
    85327:	0.093,
    85328:	0.076,
    85329:	0.088,
    85331:	0.083,
    85332:	0.06712,
    85334:  0.076,
    85335:	0.093,
    85336:	0.06712,
    85337:	0.093,
    85338:	0.088,
    85339:	0.083,
    85340:	0.063,
    85341:	0.061,
    85342:	0.063,
    85343:	0.063,
    85344:	0.076,
    85345:	0.081,
    85346:	0.101,
    85347:	0.06712,
    85348:	0.076,
    85349:	0.10712,
    85350:	0.06712,
    85351:	0.063,
    85352:	0.06712,
    85353:	0.083,
    85354:	0.063,
    85355:	0.063,
    85356:	0.09212,
    85357:	0.076,
    85359:	0.101,
    85360:	0.0585,
    85361:	0.063,
    85362:	0.0635,
    85363:	0.093,
    85364:	0.08412,
    85365:	0.08412,
    85366:	0.08412,
    85367:	0.06712,
    85372:	0.063,
    85373:	0.063,
    85374:	0.085,
    85375:	0.063,
    85376:	0.063,
    85377:	0.093,
    85378:	0.085,
    85379:	0.085,
    85380:	0.081,
    85381:	0.081,
    85382:	0.081,
    85383:	0.081,
    85385:	0.081,
    85387:	0.085,
    85388:	0.085,
    85390:	0.085,
    85392:	0.088,
    85395:	0.088,
    85396:	0.093,
    85501:	0.086,
    85531:	0.066,
    85533:	0.061,
    85534:	0.061,
    85535:	0.086,
    85536:	0.066,
    85539:	0.091,
    85540:	0.061,
    85541:	0.0872,
    85542:	0.066,
    85543:	0.066,
    85544:	0.066,
    85545:	0.066,
    85546:	0.091,
    85547:	0.0872,
    85548:	0.091,
    85550:	0.066,
    85551:	0.066,
    85552:	0.091,
    85553:	0.066,
    85554:	0.066,
    85601:	0.061,
    85602:	0.086,
    85603:	0.096,
    85605:	0.061,
    85606:	0.061,
    85607:	0.089,
    85608:	0.089,
    85609:	0.061,
    85610:	0.061,
    85611:	0.066,
    85613:	0.0785,
    85614:	0.061,
    85615:	0.061,
    85616:	0.061,
    85617:	0.061,
    85618:	0.067,
    85619:	0.061,
    85620:	0.061,
    85621:	0.086,
    85622:	0.061,
    85623:	0.067,
    85624:	0.066,
    85625:	0.061,
    85626:	0.061,
    85627:	0.061,
    85628:	0.086,
    85629:	0.081,
    85630:	0.061,
    85631:	0.067,
    85632:	0.061,
    85633:	0.061,
    85634:	0.061,
    85635:	0.0785,
    85636:	0.0785,
    85637:	0.061,
    85638:	0.096,
    85640:	0.066,
    85641:	0.061,
    85643:	0.061,
    85645:	0.061,
    85646:	0.066,
    85648:	0.066,
    85650:	0.061,
    85652:	0.086,
    85653:	0.061,
    85658:	0.086,
    85671:	0.061,
    85701:	0.081,
    85702:	0.081,
    85703:	0.081,
    85704:	0.061,
    85705:	0.081,
    85706:	0.081,
    85707:	0.081,
    85708:	0.081,
    85709:	0.081,
    85710:	0.081,
    85711:	0.081,
    85712:	0.081,
    85713:	0.081,
    85714:	0.081,
    85715:	0.081,
    85716:	0.081,
    85717:	0.081,
    85718:	0.061,
    85719:	0.081,
    85720:	0.061,
    85721:	0.081,
    85723:	0.081,
    85724:	0.081,
    85725:	0.106,
    85726:	0.081,
    85728:	0.081,
    85730:	0.081,
    85731:	0.081,
    85732:	0.081,
    85733:	0.081,
    85734:	0.081,
    85735:	0.061,
    85736:	0.061,
    85737:	0.086,
    85738:	0.061,
    85739:	0.067,
    85740:	0.061,
    85741:	0.061,
    85742:	0.061,
    85743:	0.061,
    85744:	0.081,
    85745:	0.081,
    85746:	0.061,
    85747:	0.081,
    85748:	0.081,
    85749:	0.061,
    85750:	0.061,
    85751:	0.081,
    85752:	0.061,
    85754:	0.081,
    85755:	0.086,
    85756:	0.061,
    85757:	0.061,
    85901:	0.081,
    85902:	0.081,
    85920:	0.061,
    85922:	0.061,
    85923:	0.061,
    85924:	0.061,
    85925:	0.091,
    85927:	0.061,
    85928:	0.061,
    85929:	0.061,
    85931:	0.069,
    85932:	0.061,
    85933:	0.061,
    85934:	0.061,
    85935:	0.061,
    85936:	0.091,
    85937:	0.081,
    85938:	0.091,
    85939:	0.081,
    85941:	0.061,
    85942:	0.061,
    86001:	0.08951,
    86002:	0.08951,
    86003:	0.08951,
    86004:	0.08951,
    86005:	0.08951,
    86011:	0.08951,
    86015:	0.069,
    86016:	0.069,
    86017:	0.069,
    86018:	0.069,
    86020:	0.069,
    86021:	0.0785,
    86022:	0.109,
    86023:	0.089,
    86024:	0.069,
    86025:	0.091,
    86028:	0.08951,
    86029:	0.08951,
    86031:	0.08951,
    86032:	0.061,
    86034:	0.061,
    86036:	0.069,
    86038:	0.069,
    86040:	0.099,
    86044:	0.069,
    86045:	0.069,
    86046:	0.069,
    86047:	0.091,
    86301:	0.0835,
    86302:	0.0835,
    86303:	0.0835,
    86304:	0.0835,
    86305:	0.0635,
    86312:	0.0868,
    86313:	0.0835,
    86314:	0.0868,
    86315:	0.0635,
    86320:	0.0635,
    86321:	0.0635,
    86322:	0.1,
    86323:	0.1035,
    86324:	0.0935,
    86325:	0.0635,
    86326:	0.0935,
    86327:	0.0635,
    86329:	0.0835,
    86331:	0.0985,
    86332:	0.0635,
    86333:	0.0635,
    86334:	0.0635,
    86335:	0.0635,
    86336:	0.0935,
    86337:	0.0635,
    86338:	0.0635,
    86339:	0.099,
    86340:	0.0935,
    86342:	0.0635,
    86343:	0.0635,
    86351:	0.0635,
    86401:	0.0835,
    86402:	0.0835,
    86403:	0.0785,
    86404:	0.0785,
    86405:	0.0785,
    86406:	0.0785,
    86409:	0.0585,
    86411:	0.0585,
    86412:	0.0585,
    86413:	0.0585,
    86426:	0.0585,
    86427:	0.0585,
    86429:	0.0785,
    86430:	0.0785,
    86431:	0.0585,
    86432:	0.0585,
    86433:	0.0585,
    86434:	0.0585,
    86436:	0.0585,
    86437:	0.0585,
    86438:	0.0585,
    86439:	0.0785,
    86440:	0.0585,
    86441:	0.0585,
    86442:	0.0785,
    86443:	0.0835,
    86444:	0.0585,
    86445:	0.0585,
    86446:	0.0585,
    86503:	0.061,
    86504:	0.061,
    86505:	0.061,
    86506:	0.061,
    86511:	0.061,
    86512:	0.061,
    86514:	0.061,
    86515:	0.061,
    86540:	0.061,
    86545:	0.061,
    86547:	0.061,
    86556:	0.061,
    91935: 0.080,
    92019: 0.085,
    91942: 0.0875,
    91977: 0.08,
    12345: 6.66666,
    11111: 0.055,
    90210: 1,
    31415: -1
]

