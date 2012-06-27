/*##############################################################################

    Copyright (C) 2011 HPCC Systems.

    All rights reserved. This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################## */


// limited prefix match join tests

recL := record
  UNICODE11      name;
  unsigned  val;
END;

recR := record
  UNICODE    name {MAXLENGTH(12)};
  unsigned2     val;
END;

recB := record
  VARUNICODE name {MAXLENGTH(12)};
  unsigned  val;
END;


recO := record
  UNICODE10  lname;
  UNICODE11  rname;
END;


dsL := DATASET([
  {'BABAK',1},
  {'BABY',2},
  {'BARBARB',3},
  {'BEBO',4}
], recL);

dsR := DATASET([
  {'BABARA',5},
  {'BABATUNDE',6},
  {'BABETTE',7},
  {'BABS',8},
  {'BARBAR',9},
  {'BARBARBA',10},
  {'BARBARBO',11},
  {'BARBER',12},
  {'BETTY',13}
], recR);


dsBritney := DATASET([
{ 'britney' ,1 },
{ 'brittany',2 },
{ 'brittney',3 },
{ 'britany',4 },
{ 'britny',5 },
{ 'briteny',6 },
{ 'britteny',7 },
{ 'briney',8 },
{ 'brittny',9 },
{ 'brintey',10 },
{ 'britanny',11 },
{ 'britiny',12 },
{ 'britnet',13 },
{ 'britiney',14 },
{ 'britaney',15 },
{ 'britnay',16 },
{ 'brithney',17 },
{ 'brtiney',18 },
{ 'birtney',19 },
{ 'brintney',20 },
{ 'briteney',21 },
{ 'bitney',22 },
{ 'brinty',23 },
{ 'brittaney',24 },
{ 'brittnay',25 },
{ 'britey',26 },
{ 'brittiny',27 },
{ 'brtney',28 },
{ 'bretney',29 },
{ 'britneys',30 },
{ 'britne',31 },
{ 'brytney',32 },
{ 'breatney',33 },
{ 'britiany',34 },
{ 'britnney',35 },
{ 'britnry',36 },
{ 'breatny',37 },
{ 'brittiney',38 },
{ 'britty',39 },
{ 'brotney',40 },
{ 'brutney',41 },
{ 'britteney',42 },
{ 'briyney',43 },
{ 'bittany',44 },
{ 'bridney',45 },
{ 'britainy',46 },
{ 'britmey',47 },
{ 'brietney',48 },
{ 'brithny',49 },
{ 'britni',50 },
{ 'brittant',51 },
{ 'bittney',52 },
{ 'brithey',53 },
{ 'brittiany',54 },
{ 'btitney',55 },
{ 'brietny',56 },
{ 'brinety',57 },
{ 'brintny',58 },
{ 'britnie',59 },
{ 'brittey',60 },
{ 'brittnet',61 },
{ 'brity',62 },
{ 'ritney',63 },
{ 'bretny',64 },
{ 'britnany',65 },
{ 'brinteny',66 },
{ 'brittainy',67 },
{ 'pritney',68 },
{ 'brintany',69 },
{ 'britnery',70 },
{ 'briitney',71 },
{ 'britinay',72 },
{ 'britneay',73 },
{ 'britner',74 },
{ 'britneys',75 },
{ 'britnye',76 },
{ 'britt',77 },
{ 'brttany',78 },
{ 'bitany',79 },
{ 'briny',80 },
{ 'brirney',81 },
{ 'britant',82 },
{ 'britnety',83 },
{ 'brittanny',84 },
{ 'brttney',85 },
{ 'birttany',86 },
{ 'brittani',87 },
{ 'brityney',88 },
{ 'brtitney',89 },
{ 'brienty',90 },
{ 'brritney',91 },
{ 'bbritney',92 },
{ 'briitany',93 },
{ 'britanney',94 },
{ 'briterny',95 },
{ 'britneey',96 },
{ 'britnei',97 },
{ 'britniy',98 },
{ 'britbey',99 },
{ 'britneu',100 },
{ 'britent',101 },
{ 'brittnany',102 },
{ 'britttany',103 },
{ 'btiney',104 },
{ 'birttney',105 },
{ 'breitney',106 },
{ 'brinity',107 },
{ 'britenay',108 },
{ 'britneyt',109 },
{ 'brittan',110 },
{ 'brittne',111 },
{ 'btittany',112 },
{ 'beitney',113 },
{ 'birteny',114 },
{ 'brightney',115 },
{ 'brintiny',116 },
{ 'britanty',117 },
{ 'britenny',118 },
{ 'britini',119 },
{ 'britnwy',120 },
{ 'brittni',121 },
{ 'brittnie',122 },
{ 'biritney',123 },
{ 'birtany',124 },
{ 'biteny',125 },
{ 'bratney',126 },
{ 'britani',127 },
{ 'britanie',128 },
{ 'briteany',129 },
{ 'brittay',130 },
{ 'brittinay',131 },
{ 'brtany',132 },
{ 'brtiany',133 },
{ 'birney',134 },
{ 'brirtney',135 },
{ 'britnaey',136 },
{ 'britnee',137 },
{ 'britony',138 },
{ 'brittanty',139 },
{ 'britttney',140 },
{ 'birtny',141 },
{ 'brieny',142 },
{ 'brintty',143 },
{ 'brithy',144 },
{ 'brittanie',145 },
{ 'brinney',146 },
{ 'briten',147 },
{ 'briterney',148 },
{ 'britheny',149 },
{ 'britneny',150 },
{ 'brittamy',151 },
{ 'brittmey',152 },
{ 'brytnei',153 },
{ 'btirney',154 },
{ 'rittney',155 },
{ 'brinet',156 },
{ 'britneyy',157 },
{ 'britten',158 },
{ 'beritney',159 },
{ 'bretiny',160 },
{ 'briatny',161 },
{ 'brieney',162 },
{ 'brinany',163 },
{ 'britaany',164 },
{ 'britan',165 },
{ 'britine',166 },
{ 'britnea',167 },
{ 'britnes',168 },
{ 'britnez',169 },
{ 'britnny',170 },
{ 'brittenay',171 },
{ 'brittneys',172 },
{ 'brittony',173 },
{ 'brteny',174 },
{ 'btitany',175 },
{ 'btittney',176 },
{ 'btriney',177 },
{ 'btritney',178 },
{ 'rittany',179 },
{ 'braitney',180 },
{ 'brettney',181 },
{ 'britamy',182 },
{ 'britery',183 },
{ 'britnary',184 },
{ 'brittent',185 },
{ 'bruttney',186 },
{ 'pritny',187 },
{ 'bitaney',188 },
{ 'brenty',189 },
{ 'bristney',190 },
{ 'britay',191 },
{ 'britinny',192 },
{ 'brittaany',193 },
{ 'brittanys',194 },
{ 'brittini',195 },
{ 'brittniy',196 },
{ 'brtieny',197 },
{ 'brutany',198 },
{ 'bitteny',199 },
{ 'brinttany',200 },
{ 'britanay',201 },
{ 'britinany',202 },
{ 'britn',203 },
{ 'britnew',204 },
{ 'britneyn',205 },
{ 'britrney',206 },
{ 'brtiny',207 },
{ 'brtittney',208 },
{ 'brtny',209 },
{ 'brytny',210 },
{ 'rbitney',211 },
{ 'birtiny',212 },
{ 'bithney',213 },
{ 'brattany',214 },
{ 'breitny',215 },
{ 'breteny',216 },
{ 'brightny',217 },
{ 'brintay',218 },
{ 'brinttey',219 },
{ 'briotney',220 },
{ 'britanys',221 },
{ 'britley',222 },
{ 'britneyb',223 },
{ 'britnrey',224 },
{ 'britnty',225 },
{ 'brittner',226 },
{ 'brottany',227 },
{ 'baritney',228 },
{ 'birntey',229 },
{ 'biteney',230 },
{ 'bitiny',231 },
{ 'breateny',232 },
{ 'brianty',233 },
{ 'brintye',234 },
{ 'britianny',235 },
{ 'britly',236 },
{ 'britnej',237 },
{ 'britneyu',238 },
{ 'britniey',239 },
{ 'britnnay',240 },
{ 'brittian',241 },
{ 'briyny',242 },
{ 'brrittany',243 },
{ 'brttiney',244 },
{ 'btiteny',245 },
{ 'btrittany',246 },
{ 'beritny',247 },
{ 'bhritney',248 },
{ 'birthney',249 },
{ 'breathney',250 },
{ 'breaty',251 },
{ 'bretany',252 },
{ 'briatany',253 },
{ 'brint',254 },
{ 'britenney',255 },
{ 'britian',256 },
{ 'britinty',257 },
{ 'brititney',258 },
{ 'britnsy',259 },
{ 'britrey',260 },
{ 'britsny',261 },
{ 'brittine',262 },
{ 'brittnry',263 },
{ 'brittsny',264 },
{ 'brtanny',265 },
{ 'brtittany',266 },
{ 'bruttany',267 },
{ 'brytany',268 },
{ 'btitny',269 },
{ 'pretny',270 },
{ 'ritany',271 },
{ 'bbritany',272 },
{ 'bbrittney',273 },
{ 'biitney',274 },
{ 'bitny',275 },
{ 'breathny',276 },
{ 'breney',277 },
{ 'brethney',278 },
{ 'brettny',279 },
{ 'bridny',280 },
{ 'brigney',281 },
{ 'briittney',282 },
{ 'brinaty',283 },
{ 'brinay',284 },
{ 'brinetty',285 },
{ 'brinitty',286 },
{ 'brinny',287 },
{ 'brintery',288 },
{ 'britary',289 },
{ 'britbney',290 },
{ 'brithany',291 },
{ 'britieny',292 },
{ 'britiey',293 },
{ 'britnt',294 },
{ 'britnys',295 },
{ 'britrny',296 },
{ 'brittenny',297 },
{ 'brittnee',298 },
{ 'brittnt',299 },
{ 'brney',300 },
{ 'broitney',301 },
{ 'brotny',302 },
{ 'bruteny',303 },
{ 'btiyney',304 },
{ 'btrittney',305 },
{ 'gritney',306 },
{ 'spritney',307 },
{ 'bittny',308 },
{ 'bnritney',309 },
{ 'brandy',310 },
{ 'brbritney',311 },
{ 'breatiny',312 },
{ 'breetney',313 },
{ 'bretiney',314 },
{ 'brfitney',315 },
{ 'briattany',316 },
{ 'brieteny',317 },
{ 'briety',318 },
{ 'briitny',319 },
{ 'briittany',320 },
{ 'brinie',321 },
{ 'brinteney',322 },
{ 'brintne',323 },
{ 'britaby',324 },
{ 'britaey',325 },
{ 'britainey',326 },
{ 'britinie',327 },
{ 'britinney',328 },
{ 'britmney',329 },
{ 'britnear',330 },
{ 'britnel',331 },
{ 'britneuy',332 },
{ 'britnewy',333 },
{ 'britnmey',334 },
{ 'brittaby',335 },
{ 'brittery',336 },
{ 'britthey',337 },
{ 'brittnaey',338 },
{ 'brittnat',339 },
{ 'brittneny',340 },
{ 'brittnye',341 },
{ 'brittteny',342 },
{ 'briutney',343 },
{ 'briyeny',344 },
{ 'brnity',345 },
{ 'brtteny',346 },
{ 'brttiany',347 },
{ 'bryney',348 },
{ 'brythney',349 },
{ 'brytne',350 },
{ 'brytni',351 },
{ 'brytnie',352 },
{ 'bvritney',353 },
{ 'dritney',354 },
{ 'priteny',355 },
{ 'beittany',356 },
{ 'bichney',357 },
{ 'biritny',358 },
{ 'birnety',359 },
{ 'birny',360 },
{ 'birteney',361 },
{ 'birthny',362 },
{ 'birtiney',363 },
{ 'birtteny',364 },
{ 'birttny',365 },
{ 'bitanny',366 },
{ 'bitheay',367 },
{ 'bithey',368 },
{ 'bitrney',369 },
{ 'breinty',370 },
{ 'brethny',371 },
{ 'bretne',372 },
{ 'bretniy',373 },
{ 'brettine',374 },
{ 'brighty',375 },
{ 'brihney',376 },
{ 'brihtney',377 },
{ 'briiney',378 },
{ 'briitnay',379 },
{ 'brineny',380 },
{ 'brinte',381 },
{ 'brintiney',382 },
{ 'brintneey',383 },
{ 'brinttney',384 },
{ 'brirany',385 },
{ 'brirtny',386 },
{ 'brisney',387 },
{ 'britainny',388 },
{ 'britaniy',389 },
{ 'britanu',390 },
{ 'britanyy',391 },
{ 'britatny',392 },
{ 'britdney',393 },
{ 'britemy',394 },
{ 'britenty',395 },
{ 'brither',396 },
{ 'brithne',397 },
{ 'brititany',398 },
{ 'brititny',399 },
{ 'britiy',400 },
{ 'britmeny',401 },
{ 'britneeey',402 },
{ 'britnehy',403 },
{ 'britnely',404 },
{ 'britnesy',405 },
{ 'britnetty',406 },
{ 'britnex',407 },
{ 'britneyxxx',408 },
{ 'britnity',409 },
{ 'britntey',410 },
{ 'britnyey',411 },
{ 'britterny',412 },
{ 'brittneey',413 },
{ 'brittnney',414 },
{ 'brittnyey',415 },
{ 'brityen',416 },
{ 'briytney',417 },
{ 'brltney',418 },
{ 'broteny',419 },
{ 'brtaney',420 },
{ 'brtiiany',421 },
{ 'brtinay',422 },
{ 'brtinney',423 },
{ 'brtitany',424 },
{ 'brtiteny',425 },
{ 'brtnet',426 },
{ 'brytiny',427 },
{ 'btney',428 },
{ 'drittney',429 },
{ 'pretney',430 },
{ 'rbritney',431 },
{ 'barittany',432 },
{ 'bbbritney',433 },
{ 'bbitney',434 },
{ 'bbritny',435 },
{ 'bbrittany',436 },
{ 'beitany',437 },
{ 'beitny',438 },
{ 'bertney',439 },
{ 'bertny',440 },
{ 'betney',441 },
{ 'betny',442 },
{ 'bhriney',443 },
{ 'biney',444 },
{ 'bintey',445 },
{ 'biretny',446 },
{ 'biritany',447 },
{ 'birittany',448 },
{ 'birittny',449 },
{ 'birnty',450 },
{ 'birtey',451 },
{ 'birtheny',452 },
{ 'birtieny',453 },
{ 'birtnay',454 },
{ 'birtnet',455 },
{ 'bitnet',456 },
{ 'bitttany',457 },
{ 'bnrittany',458 },
{ 'bntney',459 },
{ 'bpitney',460 },
{ 'brandi',461 },
{ 'brattney',462 },
{ 'breanty',463 },
{ 'breany',464 },
{ 'breittany',465 },
{ 'brently',466 },
{ 'brentney',467 },
{ 'brethany',468 },
{ 'brethine',469 },
{ 'bretnty',470 },
{ 'bretty',471 },
{ 'brianey',472 },
{ 'briatney',473 },
{ 'brickney',474 },
{ 'bridnea',475 },
{ 'brieatney',476 },
{ 'brientny',477 },
{ 'brietnet',478 },
{ 'briettny',479 },
{ 'briey',480 },
{ 'brighney',481 },
{ 'brigtney',482 },
{ 'brigtny',483 },
{ 'briiny',484 },
{ 'brindey',485 },
{ 'brindy',486 },
{ 'bringney',487 },
{ 'brininy',488 },
{ 'brinitey',489 },
{ 'brinsley',490 },
{ 'brinthey',491 },
{ 'brinthy',492 },
{ 'brintiy',493 },
{ 'brintneys',494 },
{ 'brintry',495 },
{ 'brinyey',496 },
{ 'briottany',497 },
{ 'brirrany',498 },
{ 'brirreny',499 },
{ 'brirtany',500 },
{ 'brirttany',501 },
{ 'brirttney',502 },
{ 'britain',503 },
{ 'britane',504 },
{ 'britaneny',505 },
{ 'britania',506 },
{ 'britann',507 },
{ 'britanna',508 },
{ 'britannie',509 },
{ 'britannt',510 },
{ 'britannu',511 },
{ 'britanyl',512 },
{ 'britanyt',513 },
{ 'briteeny',514 },
{ 'britenany',515 },
{ 'britenet',516 },
{ 'briteniy',517 },
{ 'britenys',518 },
{ 'britianey',519 },
{ 'britin',520 },
{ 'britinary',521 },
{ 'britmy',522 },
{ 'britnaney',523 },
{ 'britnat',524 },
{ 'britnbey',525 },
{ 'britndy',526 },
{ 'britneh',527 },
{ 'britneney',528 },
{ 'britney6',529 },
{ 'britneye',530 },
{ 'britneyh',531 },
{ 'britneym',532 },
{ 'britneyyy',533 },
{ 'britnhey',534 },
{ 'britnjey',535 },
{ 'britnne',536 },
{ 'britnu',537 },
{ 'britoney',538 },
{ 'britrany',539 },
{ 'britreny',540 },
{ 'britry',541 },
{ 'britsany',542 },
{ 'brittanay',543 },
{ 'brittang',544 },
{ 'brittans',545 },
{ 'brittanyh',546 },
{ 'brittanyn',547 },
{ 'brittanys',548 },
{ 'brittanyt',549 },
{ 'brittanyy',550 },
{ 'brittary',551 },
{ 'brittenie',552 },
{ 'brittenty',553 },
{ 'brittinney',554 },
{ 'brittley',555 },
{ 'brittn',556 },
{ 'brittnery',557 },
{ 'brittnety',558 },
{ 'brittneys',559 },
{ 'brittneyu',560 },
{ 'brittnsey',561 },
{ 'britttaney',562 },
{ 'britttny',563 },
{ 'brittyney',564 },
{ 'brityne',565 },
{ 'briyany',566 },
{ 'brlttney',567 },
{ 'brotaney',568 },
{ 'brotany',569 },
{ 'brottney',570 },
{ 'brriney',571 },
{ 'brrittney',572 },
{ 'brrtney',573 },
{ 'brthney',574 },
{ 'brtianny',575 },
{ 'brtineys',576 },
{ 'brtittny',577 },
{ 'brttiny',578 },
{ 'brtttany',579 },
{ 'brydney',580 },
{ 'brynty',581 },
{ 'brythey',582 },
{ 'bryttney',583 },
{ 'btiany',584 },
{ 'btirtney',585 },
{ 'btitiney',586 },
{ 'btittny',587 },
{ 'btritany',588 },
{ 'buttney',589 },
{ 'grittney',590 },
{ 'hrittney',591 },     // equal excluded
{ 'hrittney',592 },
{ 'hrittney',593 },
{ 'hrittney',594 },
{ 'hrittney',595 },
{ 'irittney',596 },             // equal included
{ 'irittney',597 },
{ 'irittney',598 },
{ 'irittney',599 },
{ 'prietny', 600 },
{ 'pritany', 601 },
{ 'prittany',602 }
], recB);



recO T(recL l,recR r) := TRANSFORM
  self.lname := l.name;
  self.rname := r.name;
END;

recO TB(recB l,recB r) := TRANSFORM
  self.lname := l.name;
  self.rname := r.name;
END;

sdsL := SORT(DISTRIBUTE(dsBritney(val<200),0),val,local) : Stored('TempL');
sdsR := SORT(DISTRIBUTE(dsBritney(val>=200),0),val,local) : Stored('TempR');
sdsS := SORT(DISTRIBUTE(dsBritney,0),val,local) : Stored('TempS');

JT := JOIN(DISTRIBUTE(dsL,0),DISTRIBUTE(dsR,0),left.name[1..*]=right.name[1..*] and left.val<=right.val,T(LEFT,RIGHT), ATMOST(left.name[1..*]=right.name[1..*],3), LOCAL);
JTB := JOIN(sdsL,sdsR,left.name[1..*]=right.name[1..*] and left.val<=right.val,TB(LEFT,RIGHT), ATMOST(left.name[1..*]=right.name[1..*],4), LOCAL);
JTBS := JOIN(sdsS,sdsS,left.name[1..*]=right.name[1..*] and left.val<=right.val,TB(LEFT,RIGHT), ATMOST(left.name[1..*]=right.name[1..*],4), LOCAL);

OUTPUT(JT);
OUTPUT(JTB);
OUTPUT(JTBS);
