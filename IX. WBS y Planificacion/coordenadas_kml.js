// Coordenadas del KML - Extraídas de doc.kml
const coordenadasKML = [
  {
    "PK": 202,
    "nombre": "202",
    "longitud": -74.671727,
    "latitud": 5.476584
  },
  {
    "PK": 203,
    "nombre": "203",
    "longitud": -74.677433,
    "latitud": 5.483585
  },
  {
    "PK": 204,
    "nombre": "204",
    "longitud": -74.682948,
    "latitud": 5.490742
  },
  {
    "PK": 205,
    "nombre": "205",
    "longitud": -74.687975,
    "latitud": 5.498186
  },
  {
    "PK": 206,
    "nombre": "206",
    "longitud": -74.689776,
    "latitud": 5.507046
  },
  {
    "PK": 207,
    "nombre": "207",
    "longitud": -74.691554,
    "latitud": 5.51591
  },
  {
    "PK": 208,
    "nombre": "208",
    "longitud": -74.692788,
    "latitud": 5.52485
  },
  {
    "PK": 209,
    "nombre": "209",
    "longitud": -74.691588,
    "latitud": 5.533766
  },
  {
    "PK": 210,
    "nombre": "210",
    "longitud": -74.68559,
    "latitud": 5.540463
  },
  {
    "PK": 211,
    "nombre": "211",
    "longitud": -74.679975,
    "latitud": 5.547264
  },
  {
    "PK": 212,
    "nombre": "212",
    "longitud": -74.676519,
    "latitud": 5.555617
  },
  {
    "PK": 213,
    "nombre": "213",
    "longitud": -74.67212,
    "latitud": 5.563501
  },
  {
    "PK": 214,
    "nombre": "214",
    "longitud": -74.672506,
    "latitud": 5.572314
  },
  {
    "PK": 215,
    "nombre": "215",
    "longitud": -74.67245,
    "latitud": 5.581323
  },
  {
    "PK": 216,
    "nombre": "216",
    "longitud": -74.668901,
    "latitud": 5.589635
  },
  {
    "PK": 217,
    "nombre": "217",
    "longitud": -74.66558,
    "latitud": 5.598043
  },
  {
    "PK": 218,
    "nombre": "218",
    "longitud": -74.66308,
    "latitud": 5.606715
  },
  {
    "PK": 219,
    "nombre": "219",
    "longitud": -74.661075,
    "latitud": 5.615527
  },
  {
    "PK": 220,
    "nombre": "220",
    "longitud": -74.661235,
    "latitud": 5.624507
  },
  {
    "PK": 221,
    "nombre": "221",
    "longitud": -74.658227,
    "latitud": 5.633004
  },
  {
    "PK": 222,
    "nombre": "222",
    "longitud": -74.654898,
    "latitud": 5.641409
  },
  {
    "PK": 223,
    "nombre": "223",
    "longitud": -74.654964,
    "latitud": 5.650176
  },
  {
    "PK": 224,
    "nombre": "224",
    "longitud": -74.656107,
    "latitud": 5.659011000000001
  },
  {
    "PK": 225,
    "nombre": "225",
    "longitud": -74.656489,
    "latitud": 5.667979000000001
  },
  {
    "PK": 226,
    "nombre": "226",
    "longitud": -74.652746,
    "latitud": 5.676206
  },
  {
    "PK": 227,
    "nombre": "227",
    "longitud": -74.649548,
    "latitud": 5.684604999999999
  },
  {
    "PK": 228,
    "nombre": "228",
    "longitud": -74.64961,
    "latitud": 5.693555
  },
  {
    "PK": 229,
    "nombre": "229",
    "longitud": -74.652628,
    "latitud": 5.702030000000001
  },
  {
    "PK": 230,
    "nombre": "230",
    "longitud": -74.657892,
    "latitud": 5.709376
  },
  {
    "PK": 231,
    "nombre": "231",
    "longitud": -74.663069,
    "latitud": 5.716762
  },
  {
    "PK": 232,
    "nombre": "232",
    "longitud": -74.667538,
    "latitud": 5.724619
  },
  {
    "PK": 233,
    "nombre": "233",
    "longitud": -74.672006,
    "latitud": 5.732475
  },
  {
    "PK": 234,
    "nombre": "234",
    "longitud": -74.675046,
    "latitud": 5.740962000000001
  },
  {
    "PK": 235,
    "nombre": "235",
    "longitud": -74.678297,
    "latitud": 5.749362000000001
  },
  {
    "PK": 237,
    "nombre": "237",
    "longitud": -74.676238,
    "latitud": 5.766021000000001
  },
  {
    "PK": 238,
    "nombre": "238",
    "longitud": -74.672092,
    "latitud": 5.774053
  },
  {
    "PK": 239,
    "nombre": "239",
    "longitud": -74.668228,
    "latitud": 5.78222
  },
  {
    "PK": 240,
    "nombre": "240",
    "longitud": -74.661293,
    "latitud": 5.787451000000001
  },
  {
    "PK": 241,
    "nombre": "241",
    "longitud": -74.65621,
    "latitud": 5.793665999999999
  },
  {
    "PK": 242,
    "nombre": "242",
    "longitud": -74.657157,
    "latitud": 5.802521000000001
  },
  {
    "PK": 243,
    "nombre": "243",
    "longitud": -74.655712,
    "latitud": 5.811399
  },
  {
    "PK": 244,
    "nombre": "244",
    "longitud": -74.656182,
    "latitud": 5.820426
  },
  {
    "PK": 245,
    "nombre": "245",
    "longitud": -74.656032,
    "latitud": 5.829467000000001
  },
  {
    "PK": 246,
    "nombre": "246",
    "longitud": -74.655304,
    "latitud": 5.838434000000001
  },
  {
    "PK": 247,
    "nombre": "247",
    "longitud": -74.652992,
    "latitud": 5.847124
  },
  {
    "PK": 248,
    "nombre": "248",
    "longitud": -74.649747,
    "latitud": 5.855518999999999
  },
  {
    "PK": 249,
    "nombre": "249",
    "longitud": -74.646081,
    "latitud": 5.863768000000001
  },
  {
    "PK": 250,
    "nombre": "250",
    "longitud": -74.64376,
    "latitud": 5.872484
  },
  {
    "PK": 251,
    "nombre": "251",
    "longitud": -74.640226,
    "latitud": 5.880776
  },
  {
    "PK": 252,
    "nombre": "252",
    "longitud": -74.640051,
    "latitud": 5.889500999999999
  },
  {
    "PK": 253,
    "nombre": "253",
    "longitud": -74.64208,
    "latitud": 5.898161999999999
  },
  {
    "PK": 254,
    "nombre": "254",
    "longitud": -74.642421,
    "latitud": 5.906981000000001
  },
  {
    "PK": 255,
    "nombre": "255",
    "longitud": -74.641432,
    "latitud": 5.915969
  },
  {
    "PK": 256,
    "nombre": "256",
    "longitud": -74.642692,
    "latitud": 5.924887
  },
  {
    "PK": 257,
    "nombre": "257",
    "longitud": -74.643541,
    "latitud": 5.933816000000001
  },
  {
    "PK": 258,
    "nombre": "258",
    "longitud": -74.640285,
    "latitud": 5.942242
  },
  {
    "PK": 259,
    "nombre": "259",
    "longitud": -74.636391,
    "latitud": 5.95036
  },
  {
    "PK": 260,
    "nombre": "260",
    "longitud": -74.633328,
    "latitud": 5.958529
  },
  {
    "PK": 261,
    "nombre": "261",
    "longitud": -74.631344,
    "latitud": 5.967309999999999
  },
  {
    "PK": 262,
    "nombre": "262",
    "longitud": -74.629415,
    "latitud": 5.976057
  },
  {
    "PK": 263,
    "nombre": "263",
    "longitud": -74.631101,
    "latitud": 5.984343
  },
  {
    "PK": 264,
    "nombre": "264",
    "longitud": -74.632502,
    "latitud": 5.993267000000001
  },
  {
    "PK": 265,
    "nombre": "265",
    "longitud": -74.635467,
    "latitud": 6.001683
  },
  {
    "PK": 266,
    "nombre": "266",
    "longitud": -74.642759,
    "latitud": 6.006255
  },
  {
    "PK": 267,
    "nombre": "267",
    "longitud": -74.645757,
    "latitud": 6.01467
  },
  {
    "PK": 268,
    "nombre": "268",
    "longitud": -74.642765,
    "latitud": 6.023085999999999
  },
  {
    "PK": 269,
    "nombre": "269",
    "longitud": -74.639943,
    "latitud": 6.031674
  },
  {
    "PK": 270,
    "nombre": "270",
    "longitud": -74.637166,
    "latitud": 6.040278
  },
  {
    "PK": 271,
    "nombre": "271",
    "longitud": -74.632147,
    "latitud": 6.047493
  },
  {
    "PK": 272,
    "nombre": "272",
    "longitud": -74.625133,
    "latitud": 6.053191
  },
  {
    "PK": 273,
    "nombre": "273",
    "longitud": -74.618119,
    "latitud": 6.058888
  },
  {
    "PK": 274,
    "nombre": "274",
    "longitud": -74.612713,
    "latitud": 6.06584
  },
  {
    "PK": 275,
    "nombre": "275",
    "longitud": -74.611958,
    "latitud": 6.074558
  },
  {
    "PK": 276,
    "nombre": "276",
    "longitud": -74.614513,
    "latitud": 6.083231
  },
  {
    "PK": 277,
    "nombre": "277",
    "longitud": -74.617071,
    "latitud": 6.091904
  },
  {
    "PK": 278,
    "nombre": "278",
    "longitud": -74.619629,
    "latitud": 6.100575999999999
  },
  {
    "PK": 279,
    "nombre": "279",
    "longitud": -74.620904,
    "latitud": 6.109442000000001
  },
  {
    "PK": 280,
    "nombre": "280",
    "longitud": -74.619171,
    "latitud": 6.118316
  },
  {
    "PK": 281,
    "nombre": "281",
    "longitud": -74.617394,
    "latitud": 6.127181
  },
  {
    "PK": 282,
    "nombre": "282",
    "longitud": -74.615614,
    "latitud": 6.136046
  },
  {
    "PK": 283,
    "nombre": "283",
    "longitud": -74.613839,
    "latitud": 6.144912
  },
  {
    "PK": 284,
    "nombre": "284",
    "longitud": -74.612161,
    "latitud": 6.153791999999999
  },
  {
    "PK": 285,
    "nombre": "285",
    "longitud": -74.614306,
    "latitud": 6.16256
  },
  {
    "PK": 286,
    "nombre": "286",
    "longitud": -74.613001,
    "latitud": 6.170964
  },
  {
    "PK": 287,
    "nombre": "287",
    "longitud": -74.610965,
    "latitud": 6.179543
  },
  {
    "PK": 288,
    "nombre": "288",
    "longitud": -74.610594,
    "latitud": 6.188577
  },
  {
    "PK": 289,
    "nombre": "289",
    "longitud": -74.610224,
    "latitud": 6.197612
  },
  {
    "PK": 290,
    "nombre": "290",
    "longitud": -74.609531,
    "latitud": 6.206602
  },
  {
    "PK": 291,
    "nombre": "291",
    "longitud": -74.604872,
    "latitud": 6.21432
  },
  {
    "PK": 292,
    "nombre": "292",
    "longitud": -74.596557,
    "latitud": 6.217114999999999
  },
  {
    "PK": 293,
    "nombre": "293",
    "longitud": -74.587568,
    "latitud": 6.218035
  },
  {
    "PK": 294,
    "nombre": "294",
    "longitud": -74.580638,
    "latitud": 6.223516
  },
  {
    "PK": 295,
    "nombre": "295",
    "longitud": -74.574699,
    "latitud": 6.230331
  },
  {
    "PK": 296,
    "nombre": "296",
    "longitud": -74.567223,
    "latitud": 6.235129999999999
  },
  {
    "PK": 297,
    "nombre": "297",
    "longitud": -74.56566,
    "latitud": 6.243797
  },
  {
    "PK": 298,
    "nombre": "298",
    "longitud": -74.561656,
    "latitud": 6.251812000000001
  },
  {
    "PK": 299,
    "nombre": "299",
    "longitud": -74.556975,
    "latitud": 6.258531
  },
  {
    "PK": 300,
    "nombre": "300",
    "longitud": -74.552025,
    "latitud": 6.26518
  },
  {
    "PK": 301,
    "nombre": "301",
    "longitud": -74.546903,
    "latitud": 6.272561999999999
  },
  {
    "PK": 302,
    "nombre": "302",
    "longitud": -74.541009,
    "latitud": 6.27939
  },
  {
    "PK": 303,
    "nombre": "303",
    "longitud": -74.533949,
    "latitud": 6.284770999999999
  },
  {
    "PK": 304,
    "nombre": "304",
    "longitud": -74.528449,
    "latitud": 6.291754
  },
  {
    "PK": 305,
    "nombre": "305",
    "longitud": -74.521031,
    "latitud": 6.296785
  },
  {
    "PK": 306,
    "nombre": "306",
    "longitud": -74.512316,
    "latitud": 6.29677
  },
  {
    "PK": 307,
    "nombre": "307",
    "longitud": -74.50413,
    "latitud": 6.299274
  },
  {
    "PK": 308,
    "nombre": "308",
    "longitud": -74.496584,
    "latitud": 6.304249
  },
  {
    "PK": 309,
    "nombre": "309",
    "longitud": -74.489569,
    "latitud": 6.309937
  },
  {
    "PK": 310,
    "nombre": "310",
    "longitud": -74.48547,
    "latitud": 6.317717000000001
  },
  {
    "PK": 311,
    "nombre": "311",
    "longitud": -74.480163,
    "latitud": 6.325025
  },
  {
    "PK": 312,
    "nombre": "312",
    "longitud": -74.475322,
    "latitud": 6.332603000000001
  },
  {
    "PK": 313,
    "nombre": "313",
    "longitud": -74.470197,
    "latitud": 6.340043
  },
  {
    "PK": 314,
    "nombre": "314",
    "longitud": -74.46671,
    "latitud": 6.348373
  },
  {
    "PK": 315,
    "nombre": "315",
    "longitud": -74.463285,
    "latitud": 6.356721
  },
  {
    "PK": 316,
    "nombre": "316",
    "longitud": -74.45849,
    "latitud": 6.364386
  },
  {
    "PK": 317,
    "nombre": "317",
    "longitud": -74.453696,
    "latitud": 6.372051
  },
  {
    "PK": 318,
    "nombre": "318",
    "longitud": -74.448909,
    "latitud": 6.379721
  },
  {
    "PK": 319,
    "nombre": "319",
    "longitud": -74.445743,
    "latitud": 6.388161999999999
  },
  {
    "PK": 320,
    "nombre": "320",
    "longitud": -74.439855,
    "latitud": 6.39502
  },
  {
    "PK": 321,
    "nombre": "321",
    "longitud": -74.433939,
    "latitud": 6.401856
  },
  {
    "PK": 322,
    "nombre": "322",
    "longitud": -74.428023,
    "latitud": 6.408693
  },
  {
    "PK": 323,
    "nombre": "323",
    "longitud": -74.423434,
    "latitud": 6.416416
  },
  {
    "PK": 324,
    "nombre": "324",
    "longitud": -74.419733,
    "latitud": 6.424654
  },
  {
    "PK": 325,
    "nombre": "325",
    "longitud": -74.4188,
    "latitud": 6.433641999999999
  },
  {
    "PK": 326,
    "nombre": "326",
    "longitud": -74.420642,
    "latitud": 6.442474
  },
  {
    "PK": 327,
    "nombre": "327",
    "longitud": -74.422792,
    "latitud": 6.451256999999999
  },
  {
    "PK": 328,
    "nombre": "328",
    "longitud": -74.421239,
    "latitud": 6.459196
  },
  {
    "PK": 329,
    "nombre": "329",
    "longitud": -74.415754,
    "latitud": 6.466312000000001
  },
  {
    "PK": 330,
    "nombre": "330",
    "longitud": -74.411813,
    "latitud": 6.474443
  },
  {
    "PK": 331,
    "nombre": "331",
    "longitud": -74.411393,
    "latitud": 6.48346
  },
  {
    "PK": 332,
    "nombre": "332",
    "longitud": -74.403975,
    "latitud": 6.484867
  },
  {
    "PK": 333,
    "nombre": "333",
    "longitud": -74.396715,
    "latitud": 6.479479000000001
  },
  {
    "PK": 334,
    "nombre": "334",
    "longitud": -74.388231,
    "latitud": 6.477292
  },
  {
    "PK": 335,
    "nombre": "335",
    "longitud": -74.380009,
    "latitud": 6.480977
  },
  {
    "PK": 336,
    "nombre": "336",
    "longitud": -74.371942,
    "latitud": 6.485056999999999
  },
  {
    "PK": 337,
    "nombre": "337",
    "longitud": -74.363898,
    "latitud": 6.488928999999999
  },
  {
    "PK": 338,
    "nombre": "338",
    "longitud": -74.35627,
    "latitud": 6.493715
  },
  {
    "PK": 339,
    "nombre": "339",
    "longitud": -74.347778,
    "latitud": 6.496817
  },
  {
    "PK": 340,
    "nombre": "340",
    "longitud": -74.339635,
    "latitud": 6.500595
  },
  {
    "PK": 341,
    "nombre": "341",
    "longitud": -74.333494,
    "latitud": 6.507131
  },
  {
    "PK": 342,
    "nombre": "342",
    "longitud": -74.32491,
    "latitud": 6.509903
  },
  {
    "PK": 343,
    "nombre": "343",
    "longitud": -74.31624,
    "latitud": 6.512392999999999
  },
  {
    "PK": 344,
    "nombre": "344",
    "longitud": -74.307938,
    "latitud": 6.515743
  },
  {
    "PK": 345,
    "nombre": "345",
    "longitud": -74.298915,
    "latitud": 6.516308
  },
  {
    "PK": 346,
    "nombre": "346",
    "longitud": -74.2905,
    "latitud": 6.519293
  },
  {
    "PK": 347,
    "nombre": "347",
    "longitud": -74.283503,
    "latitud": 6.524831
  },
  {
    "PK": 348,
    "nombre": "348",
    "longitud": -74.277576,
    "latitud": 6.531653
  },
  {
    "PK": 349,
    "nombre": "349",
    "longitud": -74.270045,
    "latitud": 6.536632
  },
  {
    "PK": 350,
    "nombre": "350",
    "longitud": -74.26235,
    "latitud": 6.541381
  },
  {
    "PK": 351,
    "nombre": "351",
    "longitud": -74.254654,
    "latitud": 6.546125999999999
  },
  {
    "PK": 352,
    "nombre": "352",
    "longitud": -74.246958,
    "latitud": 6.550871999999999
  },
  {
    "PK": 353,
    "nombre": "353",
    "longitud": -74.238962,
    "latitud": 6.555049
  },
  {
    "PK": 354,
    "nombre": "354",
    "longitud": -74.230192,
    "latitud": 6.55721
  },
  {
    "PK": 355,
    "nombre": "355",
    "longitud": -74.221342,
    "latitud": 6.559059
  },
  {
    "PK": 356,
    "nombre": "356",
    "longitud": -74.212492,
    "latitud": 6.560914
  },
  {
    "PK": 357,
    "nombre": "357",
    "longitud": -74.203561,
    "latitud": 6.562091
  },
  {
    "PK": 358,
    "nombre": "358",
    "longitud": -74.194562,
    "latitud": 6.561206999999999
  },
  {
    "PK": 359,
    "nombre": "359",
    "longitud": -74.185628,
    "latitud": 6.561733
  },
  {
    "PK": 360,
    "nombre": "360",
    "longitud": -74.177431,
    "latitud": 6.565541999999999
  },
  {
    "PK": 361,
    "nombre": "361",
    "longitud": -74.169279,
    "latitud": 6.569453000000001
  },
  {
    "PK": 362,
    "nombre": "362",
    "longitud": -74.161127,
    "latitud": 6.573366
  },
  {
    "PK": 363,
    "nombre": "363",
    "longitud": -74.152973,
    "latitud": 6.577273999999999
  },
  {
    "PK": 364,
    "nombre": "364",
    "longitud": -74.14486,
    "latitud": 6.581259
  },
  {
    "PK": 365,
    "nombre": "365",
    "longitud": -74.138368,
    "latitud": 6.587504000000001
  },
  {
    "PK": 366,
    "nombre": "366",
    "longitud": -74.131908,
    "latitud": 6.59377
  },
  {
    "PK": 367,
    "nombre": "367",
    "longitud": -74.123699,
    "latitud": 6.597561
  },
  {
    "PK": 368,
    "nombre": "368",
    "longitud": -74.115476,
    "latitud": 6.601322999999999
  },
  {
    "PK": 369,
    "nombre": "369",
    "longitud": -74.109049,
    "latitud": 6.607165
  },
  {
    "PK": 370,
    "nombre": "370",
    "longitud": -74.108424,
    "latitud": 6.616170000000001
  },
  {
    "PK": 371,
    "nombre": "371",
    "longitud": -74.102952,
    "latitud": 6.622654
  },
  {
    "PK": 372,
    "nombre": "372",
    "longitud": -74.094942,
    "latitud": 6.626851
  },
  {
    "PK": 373,
    "nombre": "373",
    "longitud": -74.086931,
    "latitud": 6.631046
  },
  {
    "PK": 374,
    "nombre": "374",
    "longitud": -74.07892,
    "latitud": 6.635241
  },
  {
    "PK": 375,
    "nombre": "375",
    "longitud": -74.071,
    "latitud": 6.639594000000001
  },
  {
    "PK": 376,
    "nombre": "376",
    "longitud": -74.064261,
    "latitud": 6.645613999999999
  },
  {
    "PK": 377,
    "nombre": "377",
    "longitud": -74.057647,
    "latitud": 6.65178
  },
  {
    "PK": 378,
    "nombre": "378",
    "longitud": -74.051202,
    "latitud": 6.658105
  },
  {
    "PK": 379,
    "nombre": "379",
    "longitud": -74.049695,
    "latitud": 6.666735999999999
  },
  {
    "PK": 380,
    "nombre": "380",
    "longitud": -74.051726,
    "latitud": 6.675547
  },
  {
    "PK": 381,
    "nombre": "381",
    "longitud": -74.053759,
    "latitud": 6.684358
  },
  {
    "PK": 382,
    "nombre": "382",
    "longitud": -74.055789,
    "latitud": 6.69317
  },
  {
    "PK": 383,
    "nombre": "383",
    "longitud": -74.054087,
    "latitud": 6.701857
  },
  {
    "PK": 384,
    "nombre": "384",
    "longitud": -74.054071,
    "latitud": 6.710889
  },
  {
    "PK": 385,
    "nombre": "385",
    "longitud": -74.051848,
    "latitud": 6.719411
  },
  {
    "PK": 386,
    "nombre": "386",
    "longitud": -74.046248,
    "latitud": 6.72633
  },
  {
    "PK": 387,
    "nombre": "387",
    "longitud": -74.042812,
    "latitud": 6.734343
  },
  {
    "PK": 388,
    "nombre": "388",
    "longitud": -74.04449,
    "latitud": 6.742676000000001
  },
  {
    "PK": 389,
    "nombre": "389",
    "longitud": -74.039686,
    "latitud": 6.750337000000001
  },
  {
    "PK": 390,
    "nombre": "390",
    "longitud": -74.032549,
    "latitud": 6.755276000000001
  },
  {
    "PK": 391,
    "nombre": "391",
    "longitud": -74.023866,
    "latitud": 6.75779
  },
  {
    "PK": 392,
    "nombre": "392",
    "longitud": -74.014941,
    "latitud": 6.759264
  },
  {
    "PK": 393,
    "nombre": "393",
    "longitud": -74.006825,
    "latitud": 6.762945
  },
  {
    "PK": 394,
    "nombre": "394",
    "longitud": -74.000507,
    "latitud": 6.769304
  },
  {
    "PK": 395,
    "nombre": "395",
    "longitud": -73.993224,
    "latitud": 6.773945
  },
  {
    "PK": 396,
    "nombre": "396",
    "longitud": -73.984424,
    "latitud": 6.776036
  },
  {
    "PK": 397,
    "nombre": "397",
    "longitud": -73.975623,
    "latitud": 6.778125
  },
  {
    "PK": 398,
    "nombre": "398",
    "longitud": -73.967297,
    "latitud": 6.776093
  },
  {
    "PK": 399,
    "nombre": "399",
    "longitud": -73.965111,
    "latitud": 6.76761
  },
  {
    "PK": 400,
    "nombre": "400",
    "longitud": -73.959037,
    "latitud": 6.762236
  },
  {
    "PK": 401,
    "nombre": "401",
    "longitud": -73.950089,
    "latitud": 6.760934999999999
  },
  {
    "PK": 402,
    "nombre": "402",
    "longitud": -73.941122,
    "latitud": 6.762007
  },
  {
    "PK": 403,
    "nombre": "403",
    "longitud": -73.933868,
    "latitud": 6.766315
  },
  {
    "PK": 404,
    "nombre": "404",
    "longitud": -73.934403,
    "latitud": 6.775282
  },
  {
    "PK": 405,
    "nombre": "405",
    "longitud": -73.930739,
    "latitud": 6.783449
  },
  {
    "PK": 406,
    "nombre": "406",
    "longitud": -73.926329,
    "latitud": 6.791343999999999
  },
  {
    "PK": 407,
    "nombre": "407",
    "longitud": -73.921921,
    "latitud": 6.799239999999999
  },
  {
    "PK": 408,
    "nombre": "408",
    "longitud": -73.917722,
    "latitud": 6.807247
  },
  {
    "PK": 409,
    "nombre": "409",
    "longitud": -73.913686,
    "latitud": 6.81534
  },
  {
    "PK": 410,
    "nombre": "410",
    "longitud": -73.908772,
    "latitud": 6.822784000000001
  },
  {
    "PK": 411,
    "nombre": "411",
    "longitud": -73.901683,
    "latitud": 6.828302
  },
  {
    "PK": 412,
    "nombre": "412",
    "longitud": -73.893629,
    "latitud": 6.830798
  },
  {
    "PK": 413,
    "nombre": "413",
    "longitud": -73.885789,
    "latitud": 6.834956
  },
  {
    "PK": 414,
    "nombre": "414",
    "longitud": -73.878364,
    "latitud": 6.840117999999999
  },
  {
    "PK": 415,
    "nombre": "415",
    "longitud": -73.874369,
    "latitud": 6.84782
  },
  {
    "PK": 416,
    "nombre": "416",
    "longitud": -73.870379,
    "latitud": 6.855703
  },
  {
    "PK": 417,
    "nombre": "417",
    "longitud": -73.866183,
    "latitud": 6.863685
  },
  {
    "PK": 418,
    "nombre": "418",
    "longitud": -73.862769,
    "latitud": 6.872007999999999
  },
  {
    "PK": 419,
    "nombre": "419",
    "longitud": -73.858942,
    "latitud": 6.880081
  },
  {
    "PK": 420,
    "nombre": "420",
    "longitud": -73.854517,
    "latitud": 6.887871
  },
  {
    "PK": 421,
    "nombre": "421",
    "longitud": -73.85452,
    "latitud": 6.896794000000001
  },
  {
    "PK": 422,
    "nombre": "422",
    "longitud": -73.851981,
    "latitud": 6.905472
  },
  {
    "PK": 423,
    "nombre": "423",
    "longitud": -73.846142,
    "latitud": 6.912326
  },
  {
    "PK": 424,
    "nombre": "424",
    "longitud": -73.839917,
    "latitud": 6.917993
  },
  {
    "PK": 425,
    "nombre": "425",
    "longitud": -73.843245,
    "latitud": 6.926337000000001
  },
  {
    "PK": 426,
    "nombre": "426",
    "longitud": -73.845963,
    "latitud": 6.934815000000001
  },
  {
    "PK": 427,
    "nombre": "427",
    "longitud": -73.845983,
    "latitud": 6.943092
  },
  {
    "PK": 428,
    "nombre": "428",
    "longitud": -73.847754,
    "latitud": 6.951613000000001
  },
  {
    "PK": 429,
    "nombre": "429",
    "longitud": -73.851701,
    "latitud": 6.959619
  },
  {
    "PK": 430,
    "nombre": "430",
    "longitud": -73.855536,
    "latitud": 6.967716000000001
  },
  {
    "PK": 431,
    "nombre": "431",
    "longitud": -73.852812,
    "latitud": 6.976004000000001
  },
  {
    "PK": 432,
    "nombre": "432",
    "longitud": -73.849325,
    "latitud": 6.984295
  },
  {
    "PK": 433,
    "nombre": "433",
    "longitud": -73.846135,
    "latitud": 6.992587
  },
  {
    "PK": 434,
    "nombre": "434",
    "longitud": -73.842276,
    "latitud": 7.000159
  },
  {
    "PK": 435,
    "nombre": "435",
    "longitud": -73.836409,
    "latitud": 7.006466
  },
  {
    "PK": 436,
    "nombre": "436",
    "longitud": -73.832784,
    "latitud": 7.01469
  },
  {
    "PK": 437,
    "nombre": "437",
    "longitud": -73.829789,
    "latitud": 7.023128
  },
  {
    "PK": 438,
    "nombre": "438",
    "longitud": -73.82733,
    "latitud": 7.031536
  },
  {
    "PK": 439,
    "nombre": "439",
    "longitud": -73.833704,
    "latitud": 7.037714
  },
  {
    "PK": 440,
    "nombre": "440",
    "longitud": -73.839439,
    "latitud": 7.044538
  },
  {
    "PK": 441,
    "nombre": "441",
    "longitud": -73.845846,
    "latitud": 7.050779
  },
  {
    "PK": 442,
    "nombre": "442",
    "longitud": -73.847495,
    "latitud": 7.059417
  },
  {
    "PK": 443,
    "nombre": "443",
    "longitud": -73.84773,
    "latitud": 7.068456000000001
  },
  {
    "PK": 444,
    "nombre": "444",
    "longitud": -73.846718,
    "latitud": 7.077381999999999
  },
  {
    "PK": 445,
    "nombre": "445",
    "longitud": -73.844615,
    "latitud": 7.086177000000001
  },
  {
    "PK": 446,
    "nombre": "446",
    "longitud": -73.846653,
    "latitud": 7.094629
  },
  {
    "PK": 447,
    "nombre": "447",
    "longitud": -73.849967,
    "latitud": 7.102629
  },
  {
    "PK": 448,
    "nombre": "448",
    "longitud": -73.855923,
    "latitud": 7.109437
  },
  {
    "PK": 449,
    "nombre": "449",
    "longitud": -73.854963,
    "latitud": 7.117946
  },
  {
    "PK": 450,
    "nombre": "450",
    "longitud": -73.851576,
    "latitud": 7.126321
  },
  {
    "PK": 451,
    "nombre": "451",
    "longitud": -73.84397,
    "latitud": 7.130986
  },
  {
    "PK": 452,
    "nombre": "452",
    "longitud": -73.838184,
    "latitud": 7.137934
  },
  {
    "PK": 453,
    "nombre": "453",
    "longitud": -73.83483,
    "latitud": 7.146083
  },
  {
    "PK": 454,
    "nombre": "454",
    "longitud": -73.831915,
    "latitud": 7.154425
  },
  {
    "PK": 455,
    "nombre": "455",
    "longitud": -73.825297,
    "latitud": 7.160220000000001
  },
  {
    "PK": 456,
    "nombre": "456",
    "longitud": -73.820993,
    "latitud": 7.168175000000001
  },
  {
    "PK": 457,
    "nombre": "457",
    "longitud": -73.818344,
    "latitud": 7.176773
  },
  {
    "PK": 458,
    "nombre": "458",
    "longitud": -73.814372,
    "latitud": 7.18489
  },
  {
    "PK": 459,
    "nombre": "459",
    "longitud": -73.810109,
    "latitud": 7.19266
  },
  {
    "PK": 460,
    "nombre": "460",
    "longitud": -73.804492,
    "latitud": 7.199684
  },
  {
    "PK": 461,
    "nombre": "461",
    "longitud": -73.8001,
    "latitud": 7.207568
  },
  {
    "PK": 462,
    "nombre": "462",
    "longitud": -73.796089,
    "latitud": 7.215675
  },
  {
    "PK": 463,
    "nombre": "463",
    "longitud": -73.792076,
    "latitud": 7.22378
  },
  {
    "PK": 464,
    "nombre": "464",
    "longitud": -73.788718,
    "latitud": 7.232116
  },
  {
    "PK": 465,
    "nombre": "465",
    "longitud": -73.787485,
    "latitud": 7.241074
  },
  {
    "PK": 466,
    "nombre": "466",
    "longitud": -73.786232,
    "latitud": 7.250029
  },
  {
    "PK": 467,
    "nombre": "467",
    "longitud": -73.784979,
    "latitud": 7.258984
  },
  {
    "PK": 468,
    "nombre": "468",
    "longitud": -73.785727,
    "latitud": 7.267981
  },
  {
    "PK": 469,
    "nombre": "469",
    "longitud": -73.786722,
    "latitud": 7.276968
  },
  {
    "PK": 470,
    "nombre": "470",
    "longitud": -73.787725,
    "latitud": 7.285954
  },
  {
    "PK": 471,
    "nombre": "471",
    "longitud": -73.788731,
    "latitud": 7.29494
  },
  {
    "PK": 472,
    "nombre": "472",
    "longitud": -73.789738,
    "latitud": 7.303926
  },
  {
    "PK": 473,
    "nombre": "473",
    "longitud": -73.793232,
    "latitud": 7.312234
  },
  {
    "PK": 474,
    "nombre": "474",
    "longitud": -73.796691,
    "latitud": 7.320547000000001
  },
  {
    "PK": 475,
    "nombre": "475",
    "longitud": -73.794417,
    "latitud": 7.329278
  },
  {
    "PK": 476,
    "nombre": "476",
    "longitud": -73.790616,
    "latitud": 7.337348
  },
  {
    "PK": 477,
    "nombre": "477",
    "longitud": -73.787309,
    "latitud": 7.345214
  },
  {
    "PK": 478,
    "nombre": "478",
    "longitud": -73.782936,
    "latitud": 7.352893000000001
  },
  {
    "PK": 479,
    "nombre": "479",
    "longitud": -73.777725,
    "latitud": 7.359977
  },
  {
    "PK": 480,
    "nombre": "480",
    "longitud": -73.769151,
    "latitud": 7.362712
  },
  {
    "PK": 481,
    "nombre": "481",
    "longitud": -73.765125,
    "latitud": 7.370756
  },
  {
    "PK": 482,
    "nombre": "482",
    "longitud": -73.758852,
    "latitud": 7.377102
  },
  {
    "PK": 483,
    "nombre": "483",
    "longitud": -73.754603,
    "latitud": 7.384782
  },
  {
    "PK": 484,
    "nombre": "484",
    "longitud": -73.753222,
    "latitud": 7.393170000000001
  },
  {
    "PK": 485,
    "nombre": "485",
    "longitud": -73.747199,
    "latitud": 7.399796
  },
  {
    "PK": 486,
    "nombre": "486",
    "longitud": -73.742176,
    "latitud": 7.406523
  },
  {
    "PK": 487,
    "nombre": "487",
    "longitud": -73.73375,
    "latitud": 7.409843
  },
  {
    "PK": 488,
    "nombre": "488",
    "longitud": -73.728204,
    "latitud": 7.416127
  },
  {
    "PK": 489,
    "nombre": "489",
    "longitud": -73.727066,
    "latitud": 7.425017
  },
  {
    "PK": 490,
    "nombre": "490",
    "longitud": -73.729568,
    "latitud": 7.433505
  },
  {
    "PK": 491,
    "nombre": "491",
    "longitud": -73.730884,
    "latitud": 7.442447999999999
  },
  {
    "PK": 492,
    "nombre": "492",
    "longitud": -73.726217,
    "latitud": 7.450036
  },
  {
    "PK": 493,
    "nombre": "493",
    "longitud": -73.720775,
    "latitud": 7.457265000000001
  },
  {
    "PK": 494,
    "nombre": "494",
    "longitud": -73.719208,
    "latitud": 7.466102
  },
  {
    "PK": 495,
    "nombre": "495",
    "longitud": -73.715679,
    "latitud": 7.474266000000001
  },
  {
    "PK": 496,
    "nombre": "496",
    "longitud": -73.709219,
    "latitud": 7.480575
  },
  {
    "PK": 497,
    "nombre": "497",
    "longitud": -73.70026,
    "latitud": 7.481581
  },
  {
    "PK": 498,
    "nombre": "498",
    "longitud": -73.691344,
    "latitud": 7.48318
  },
  {
    "PK": 499,
    "nombre": "499",
    "longitud": -73.682776,
    "latitud": 7.485656
  },
  {
    "PK": 500,
    "nombre": "500",
    "longitud": -73.675233,
    "latitud": 7.490416999999999
  },
  {
    "PK": 501,
    "nombre": "501",
    "longitud": -73.667237,
    "latitud": 7.494443
  },
  {
    "PK": 502,
    "nombre": "502",
    "longitud": -73.660571,
    "latitud": 7.500566000000001
  },
  {
    "PK": 503,
    "nombre": "503",
    "longitud": -73.653903,
    "latitud": 7.506689
  },
  {
    "PK": 504,
    "nombre": "504",
    "longitud": -73.647238,
    "latitud": 7.512813
  },
  {
    "PK": 505,
    "nombre": "505",
    "longitud": -73.640135,
    "latitud": 7.518421
  },
  {
    "PK": 506,
    "nombre": "506",
    "longitud": -73.633088,
    "latitud": 7.524092
  },
  {
    "PK": 507,
    "nombre": "507",
    "longitud": -73.626691,
    "latitud": 7.530495
  },
  {
    "PK": 508,
    "nombre": "508",
    "longitud": -73.62108,
    "latitud": 7.537579
  },
  {
    "PK": 509,
    "nombre": "509",
    "longitud": -73.615693,
    "latitud": 7.544848999999999
  },
  {
    "PK": 510,
    "nombre": "510",
    "longitud": -73.610305,
    "latitud": 7.552118
  },
  {
    "PK": 511,
    "nombre": "511",
    "longitud": -73.60491,
    "latitud": 7.559381000000001
  },
  {
    "PK": 512,
    "nombre": "512",
    "longitud": -73.599515,
    "latitud": 7.566645
  },
  {
    "PK": 513,
    "nombre": "513",
    "longitud": -73.594123,
    "latitud": 7.573912
  },
  {
    "PK": 514,
    "nombre": "514",
    "longitud": -73.588727,
    "latitud": 7.581175999999999
  },
  {
    "PK": 515,
    "nombre": "515",
    "longitud": -73.583559,
    "latitud": 7.588588
  },
  {
    "PK": 516,
    "nombre": "516",
    "longitud": -73.57919,
    "latitud": 7.596509
  },
  {
    "PK": 517,
    "nombre": "517",
    "longitud": -73.57531,
    "latitud": 7.60468
  },
  {
    "PK": 518,
    "nombre": "518",
    "longitud": -73.571476,
    "latitud": 7.612872
  },
  {
    "PK": 519,
    "nombre": "519",
    "longitud": -73.566878,
    "latitud": 7.620605
  },
  {
    "PK": 520,
    "nombre": "520",
    "longitud": -73.561173,
    "latitud": 7.627630000000001
  },
  {
    "PK": 521,
    "nombre": "521",
    "longitud": -73.55547,
    "latitud": 7.634657
  },
  {
    "PK": 522,
    "nombre": "522",
    "longitud": -73.549763,
    "latitud": 7.641681
  },
  {
    "PK": 523,
    "nombre": "523",
    "longitud": -73.544052,
    "latitud": 7.648701
  },
  {
    "PK": 524,
    "nombre": "524",
    "longitud": -73.538339,
    "latitud": 7.655719999999999
  },
  {
    "PK": 525,
    "nombre": "525",
    "longitud": -73.532631,
    "latitud": 7.662743
  },
  {
    "PK": 526,
    "nombre": "526",
    "longitud": -73.526929,
    "latitud": 7.669771
  },
  {
    "PK": 527,
    "nombre": "527",
    "longitud": -73.521227,
    "latitud": 7.676799
  },
  {
    "PK": 528,
    "nombre": "528",
    "longitud": -73.515527,
    "latitud": 7.683827999999999
  },
  {
    "PK": 529,
    "nombre": "529",
    "longitud": -73.514306,
    "latitud": 7.692148
  },
  {
    "PK": 530,
    "nombre": "530",
    "longitud": -73.516609,
    "latitud": 7.700893
  },
  {
    "PK": 531,
    "nombre": "531",
    "longitud": -73.518927,
    "latitud": 7.709634
  },
  {
    "PK": 532,
    "nombre": "532",
    "longitud": -73.521262,
    "latitud": 7.71837
  },
  {
    "PK": 533,
    "nombre": "533",
    "longitud": -73.52358,
    "latitud": 7.727109
  },
  {
    "PK": 534,
    "nombre": "534",
    "longitud": -73.52589,
    "latitud": 7.735852
  },
  {
    "PK": 535,
    "nombre": "535",
    "longitud": -73.528196,
    "latitud": 7.744596
  },
  {
    "PK": 536,
    "nombre": "536",
    "longitud": -73.53054,
    "latitud": 7.753329999999999
  },
  {
    "PK": 537,
    "nombre": "537",
    "longitud": -73.532876,
    "latitud": 7.762066
  },
  {
    "PK": 538,
    "nombre": "538",
    "longitud": -73.535231,
    "latitud": 7.770797
  },
  {
    "PK": 539,
    "nombre": "539",
    "longitud": -73.537601,
    "latitud": 7.779524
  },
  {
    "PK": 540,
    "nombre": "540",
    "longitud": -73.539968,
    "latitud": 7.788252
  },
  {
    "PK": 541,
    "nombre": "541",
    "longitud": -73.542341,
    "latitud": 7.796978
  },
  {
    "PK": 542,
    "nombre": "542",
    "longitud": -73.544715,
    "latitud": 7.805704
  },
  {
    "PK": 543,
    "nombre": "543",
    "longitud": -73.547084,
    "latitud": 7.814431000000001
  },
  {
    "PK": 544,
    "nombre": "544",
    "longitud": -73.549452,
    "latitud": 7.823159
  },
  {
    "PK": 545,
    "nombre": "545",
    "longitud": -73.55183,
    "latitud": 7.831883
  },
  {
    "PK": 546,
    "nombre": "546",
    "longitud": -73.554233,
    "latitud": 7.840602
  },
  {
    "PK": 547,
    "nombre": "547",
    "longitud": -73.556636,
    "latitud": 7.84932
  },
  {
    "PK": 548,
    "nombre": "548",
    "longitud": -73.559048,
    "latitud": 7.858031999999999
  },
  {
    "PK": 549,
    "nombre": "549",
    "longitud": -73.56147,
    "latitud": 7.866745
  },
  {
    "PK": 550,
    "nombre": "550",
    "longitud": -73.563902,
    "latitud": 7.875455000000001
  },
  {
    "PK": 551,
    "nombre": "551",
    "longitud": -73.566343,
    "latitud": 7.884163
  },
  {
    "PK": 552,
    "nombre": "552",
    "longitud": -73.568795,
    "latitud": 7.892868
  },
  {
    "PK": 553,
    "nombre": "553",
    "longitud": -73.571263,
    "latitud": 7.901568
  },
  {
    "PK": 554,
    "nombre": "554",
    "longitud": -73.573736,
    "latitud": 7.910266999999999
  },
  {
    "PK": 555,
    "nombre": "555",
    "longitud": -73.576215,
    "latitud": 7.918963999999999
  },
  {
    "PK": 556,
    "nombre": "556",
    "longitud": -73.578718,
    "latitud": 7.927655
  },
  {
    "PK": 557,
    "nombre": "557",
    "longitud": -73.582426,
    "latitud": 7.935847
  },
  {
    "PK": 558,
    "nombre": "558",
    "longitud": -73.586833,
    "latitud": 7.943738999999999
  },
  {
    "PK": 559,
    "nombre": "559",
    "longitud": -73.590438,
    "latitud": 7.952035
  },
  {
    "PK": 560,
    "nombre": "560",
    "longitud": -73.594049,
    "latitud": 7.960330000000001
  },
  {
    "PK": 561,
    "nombre": "561",
    "longitud": -73.597688,
    "latitud": 7.968612
  },
  {
    "PK": 562,
    "nombre": "562",
    "longitud": -73.601326,
    "latitud": 7.976894
  },
  {
    "PK": 563,
    "nombre": "563",
    "longitud": -73.60497,
    "latitud": 7.985174000000001
  },
  {
    "PK": 564,
    "nombre": "564",
    "longitud": -73.608631,
    "latitud": 7.993446
  },
  {
    "PK": 565,
    "nombre": "565",
    "longitud": -73.612295,
    "latitud": 8.001717
  },
  {
    "PK": 566,
    "nombre": "566",
    "longitud": -73.615977,
    "latitud": 8.00998
  },
  {
    "PK": 567,
    "nombre": "567",
    "longitud": -73.61968,
    "latitud": 8.018235
  },
  {
    "PK": 568,
    "nombre": "568",
    "longitud": -73.623394,
    "latitud": 8.026483
  },
  {
    "PK": 569,
    "nombre": "569",
    "longitud": -73.627085,
    "latitud": 8.034742
  },
  {
    "PK": 570,
    "nombre": "570",
    "longitud": -73.630276,
    "latitud": 8.043206
  },
  {
    "PK": 571,
    "nombre": "571",
    "longitud": -73.633439,
    "latitud": 8.05168
  },
  {
    "PK": 572,
    "nombre": "572",
    "longitud": -73.636605,
    "latitud": 8.060153
  },
  {
    "PK": 573,
    "nombre": "573",
    "longitud": -73.639775,
    "latitud": 8.068625
  },
  {
    "PK": 574,
    "nombre": "574",
    "longitud": -73.642939,
    "latitud": 8.077098
  },
  {
    "PK": 575,
    "nombre": "575",
    "longitud": -73.646107,
    "latitud": 8.085571
  },
  {
    "PK": 576,
    "nombre": "576",
    "longitud": -73.649271,
    "latitud": 8.094045
  },
  {
    "PK": 577,
    "nombre": "577",
    "longitud": -73.652435,
    "latitud": 8.102519
  },
  {
    "PK": 578,
    "nombre": "578",
    "longitud": -73.655597,
    "latitud": 8.110994
  },
  {
    "PK": 579,
    "nombre": "579",
    "longitud": -73.658758,
    "latitud": 8.119469
  },
  {
    "PK": 580,
    "nombre": "580",
    "longitud": -73.661925,
    "latitud": 8.127942
  },
  {
    "PK": 581,
    "nombre": "581",
    "longitud": -73.665088,
    "latitud": 8.136416
  },
  {
    "PK": 582,
    "nombre": "582",
    "longitud": -73.668258,
    "latitud": 8.144888
  },
  {
    "PK": 583,
    "nombre": "583",
    "longitud": -73.671425,
    "latitud": 8.153361
  },
  {
    "PK": 584,
    "nombre": "584",
    "longitud": -73.674588,
    "latitud": 8.161836
  },
  {
    "PK": 585,
    "nombre": "585",
    "longitud": -73.677751,
    "latitud": 8.17031
  },
  {
    "PK": 586,
    "nombre": "586",
    "longitud": -73.680913,
    "latitud": 8.178785
  },
  {
    "PK": 587,
    "nombre": "587",
    "longitud": -73.684077,
    "latitud": 8.18726
  },
  {
    "PK": 588,
    "nombre": "588",
    "longitud": -73.687235,
    "latitud": 8.195736
  },
  {
    "PK": 589,
    "nombre": "589",
    "longitud": -73.690229,
    "latitud": 8.204266
  },
  {
    "PK": 590,
    "nombre": "590",
    "longitud": -73.692438,
    "latitud": 8.213036
  },
  {
    "PK": 591,
    "nombre": "591",
    "longitud": -73.694651,
    "latitud": 8.221805
  },
  {
    "PK": 592,
    "nombre": "592",
    "longitud": -73.696862,
    "latitud": 8.230574
  },
  {
    "PK": 593,
    "nombre": "593",
    "longitud": -73.699778,
    "latitud": 8.23913
  },
  {
    "PK": 594,
    "nombre": "594",
    "longitud": -73.702872,
    "latitud": 8.24763
  },
  {
    "PK": 595,
    "nombre": "595",
    "longitud": -73.705964,
    "latitud": 8.256131
  },
  {
    "PK": 596,
    "nombre": "596",
    "longitud": -73.709062,
    "latitud": 8.26463
  },
  {
    "PK": 597,
    "nombre": "597",
    "longitud": -73.712161,
    "latitud": 8.273128
  },
  {
    "PK": 598,
    "nombre": "598",
    "longitud": -73.715263,
    "latitud": 8.281625
  },
  {
    "PK": 599,
    "nombre": "599",
    "longitud": -73.714559,
    "latitud": 8.290237
  },
  {
    "PK": 600,
    "nombre": "600",
    "longitud": -73.71184,
    "latitud": 8.298789
  },
  {
    "PK": 601,
    "nombre": "601",
    "longitud": -73.714479,
    "latitud": 8.307426
  },
  {
    "PK": 602,
    "nombre": "602",
    "longitud": -73.716052,
    "latitud": 8.316275
  },
  {
    "PK": 603,
    "nombre": "603",
    "longitud": -73.716799,
    "latitud": 8.32528
  },
  {
    "PK": 604,
    "nombre": "604",
    "longitud": -73.719298,
    "latitud": 8.333972
  },
  {
    "PK": 605,
    "nombre": "605",
    "longitud": -73.720495,
    "latitud": 8.342822
  },
  {
    "PK": 606,
    "nombre": "606",
    "longitud": -73.719572,
    "latitud": 8.351817
  },
  {
    "PK": 607,
    "nombre": "607",
    "longitud": -73.718659,
    "latitud": 8.360813
  },
  {
    "PK": 608,
    "nombre": "608",
    "longitud": -73.717741,
    "latitud": 8.369808
  },
  {
    "PK": 609,
    "nombre": "609",
    "longitud": -73.716821,
    "latitud": 8.378803
  },
  {
    "PK": 610,
    "nombre": "610",
    "longitud": -73.715859,
    "latitud": 8.387794
  },
  {
    "PK": 611,
    "nombre": "611",
    "longitud": -73.714897,
    "latitud": 8.396785
  },
  {
    "PK": 612,
    "nombre": "612",
    "longitud": -73.713938,
    "latitud": 8.405776
  },
  {
    "PK": 613,
    "nombre": "613",
    "longitud": -73.712979,
    "latitud": 8.414767
  },
  {
    "PK": 614,
    "nombre": "614",
    "longitud": -73.712012,
    "latitud": 8.423757
  },
  {
    "PK": 615,
    "nombre": "615",
    "longitud": -73.711066,
    "latitud": 8.432749
  },
  {
    "PK": 616,
    "nombre": "616",
    "longitud": -73.710119,
    "latitud": 8.441741
  },
  {
    "PK": 617,
    "nombre": "617",
    "longitud": -73.709172,
    "latitud": 8.450734
  },
  {
    "PK": 618,
    "nombre": "618",
    "longitud": -73.708237,
    "latitud": 8.459727
  },
  {
    "PK": 619,
    "nombre": "619",
    "longitud": -73.707304,
    "latitud": 8.468721
  },
  {
    "PK": 620,
    "nombre": "620",
    "longitud": -73.706376,
    "latitud": 8.477715
  },
  {
    "PK": 621,
    "nombre": "621",
    "longitud": -73.705946,
    "latitud": 8.486732
  },
  {
    "PK": 622,
    "nombre": "622",
    "longitud": -73.706284,
    "latitud": 8.495767
  },
  {
    "PK": 623,
    "nombre": "623",
    "longitud": -73.706618,
    "latitud": 8.504802
  },
  {
    "PK": 624,
    "nombre": "624",
    "longitud": -73.706958,
    "latitud": 8.513837
  },
  {
    "PK": 625,
    "nombre": "625",
    "longitud": -73.707289,
    "latitud": 8.522872
  },
  {
    "PK": 626,
    "nombre": "626",
    "longitud": -73.707135,
    "latitud": 8.531886
  },
  {
    "PK": 627,
    "nombre": "627",
    "longitud": -73.704515,
    "latitud": 8.540542
  },
  {
    "PK": 628,
    "nombre": "628",
    "longitud": -73.701846,
    "latitud": 8.549184
  },
  {
    "PK": 629,
    "nombre": "629",
    "longitud": -73.699179,
    "latitud": 8.557827
  },
  {
    "PK": 630,
    "nombre": "630",
    "longitud": -73.69729,
    "latitud": 8.566667
  },
  {
    "PK": 631,
    "nombre": "631",
    "longitud": -73.695566,
    "latitud": 8.575544
  },
  {
    "PK": 632,
    "nombre": "632",
    "longitud": -73.693843,
    "latitud": 8.584421
  },
  {
    "PK": 633,
    "nombre": "633",
    "longitud": -73.692125,
    "latitud": 8.5933
  },
  {
    "PK": 634,
    "nombre": "634",
    "longitud": -73.690411,
    "latitud": 8.602179
  },
  {
    "PK": 635,
    "nombre": "635",
    "longitud": -73.688699,
    "latitud": 8.611058
  },
  {
    "PK": 636,
    "nombre": "636",
    "longitud": -73.686993,
    "latitud": 8.619939
  },
  {
    "PK": 637,
    "nombre": "637",
    "longitud": -73.68529,
    "latitud": 8.62882
  },
  {
    "PK": 638,
    "nombre": "638",
    "longitud": -73.683597,
    "latitud": 8.637703
  },
  {
    "PK": 639,
    "nombre": "639",
    "longitud": -73.683473,
    "latitud": 8.646716
  },
  {
    "PK": 640,
    "nombre": "640",
    "longitud": -73.684217,
    "latitud": 8.655727
  },
  {
    "PK": 641,
    "nombre": "641",
    "longitud": -73.684969,
    "latitud": 8.664737
  },
  {
    "PK": 642,
    "nombre": "642",
    "longitud": -73.685723,
    "latitud": 8.673748
  },
  {
    "PK": 643,
    "nombre": "643",
    "longitud": -73.686474,
    "latitud": 8.682758
  },
  {
    "PK": 644,
    "nombre": "644",
    "longitud": -73.687227,
    "latitud": 8.691768
  },
  {
    "PK": 645,
    "nombre": "645",
    "longitud": -73.687981,
    "latitud": 8.700779
  },
  {
    "PK": 646,
    "nombre": "646",
    "longitud": -73.688741,
    "latitud": 8.709788
  },
  {
    "PK": 647,
    "nombre": "647",
    "longitud": -73.689494,
    "latitud": 8.718799
  },
  {
    "PK": 648,
    "nombre": "648",
    "longitud": -73.690248,
    "latitud": 8.727809
  },
  {
    "PK": 649,
    "nombre": "649",
    "longitud": -73.691003,
    "latitud": 8.736819
  },
  {
    "PK": 650,
    "nombre": "650",
    "longitud": -73.691753,
    "latitud": 8.74583
  },
  {
    "PK": 651,
    "nombre": "651",
    "longitud": -73.692505,
    "latitud": 8.75484
  },
  {
    "PK": 652,
    "nombre": "652",
    "longitud": -73.69326,
    "latitud": 8.76385
  },
  {
    "PK": 653,
    "nombre": "653",
    "longitud": -73.694018,
    "latitud": 8.77286
  },
  {
    "PK": 654,
    "nombre": "654",
    "longitud": -73.694777,
    "latitud": 8.78187
  },
  {
    "PK": 655,
    "nombre": "655",
    "longitud": -73.695527,
    "latitud": 8.79088
  },
  {
    "PK": 656,
    "nombre": "656",
    "longitud": -73.696282,
    "latitud": 8.79989
  },
  {
    "PK": 657,
    "nombre": "657",
    "longitud": -73.697042,
    "latitud": 8.8089
  },
  {
    "PK": 658,
    "nombre": "658",
    "longitud": -73.697619,
    "latitud": 8.817921
  },
  {
    "PK": 659,
    "nombre": "659",
    "longitud": -73.697915,
    "latitud": 8.826958
  },
  {
    "PK": 660,
    "nombre": "660",
    "longitud": -73.69821,
    "latitud": 8.835994
  },
  {
    "PK": 661,
    "nombre": "661",
    "longitud": -73.698503,
    "latitud": 8.845031
  },
  {
    "PK": 662,
    "nombre": "662",
    "longitud": -73.698795,
    "latitud": 8.854068
  },
  {
    "PK": 663,
    "nombre": "663",
    "longitud": -73.699087,
    "latitud": 8.863104
  },
  {
    "PK": 664,
    "nombre": "664",
    "longitud": -73.69813,
    "latitud": 8.872049
  },
  {
    "PK": 665,
    "nombre": "665",
    "longitud": -73.696077,
    "latitud": 8.880857
  },
  {
    "PK": 666,
    "nombre": "666",
    "longitud": -73.695374,
    "latitud": 8.889826
  },
  {
    "PK": 667,
    "nombre": "667",
    "longitud": -73.695683,
    "latitud": 8.898862
  },
  {
    "PK": 668,
    "nombre": "668",
    "longitud": -73.695991,
    "latitud": 8.907898
  },
  {
    "PK": 669,
    "nombre": "669",
    "longitud": -73.6963,
    "latitud": 8.916934
  },
  {
    "PK": 670,
    "nombre": "670",
    "longitud": -73.696609,
    "latitud": 8.925971
  },
  {
    "PK": 671,
    "nombre": "671",
    "longitud": -73.69539,
    "latitud": 8.93487
  },
  {
    "PK": 672,
    "nombre": "672",
    "longitud": -73.693772,
    "latitud": 8.943726
  },
  {
    "PK": 673,
    "nombre": "673",
    "longitud": -73.693923,
    "latitud": 8.952766
  },
  {
    "PK": 674,
    "nombre": "674",
    "longitud": -73.694078,
    "latitud": 8.961806
  },
  {
    "PK": 675,
    "nombre": "675",
    "longitud": -73.694238,
    "latitud": 8.970846
  },
  {
    "PK": 676,
    "nombre": "676",
    "longitud": -73.694392,
    "latitud": 8.979886
  },
  {
    "PK": 677,
    "nombre": "677",
    "longitud": -73.694542,
    "latitud": 8.988926
  },
  {
    "PK": 678,
    "nombre": "678",
    "longitud": -73.694702,
    "latitud": 8.997966
  },
  {
    "PK": 679,
    "nombre": "679",
    "longitud": -73.69442,
    "latitud": 9.006996
  },
  {
    "PK": 680,
    "nombre": "680",
    "longitud": -73.693585,
    "latitud": 9.015999
  },
  {
    "PK": 681,
    "nombre": "681",
    "longitud": -73.692746,
    "latitud": 9.025002
  },
  {
    "PK": 682,
    "nombre": "682",
    "longitud": -73.691908,
    "latitud": 9.034004
  },
  {
    "PK": 683,
    "nombre": "683",
    "longitud": -73.690081,
    "latitud": 9.042794
  },
  {
    "PK": 684,
    "nombre": "684",
    "longitud": -73.685919,
    "latitud": 9.050834
  },
  {
    "PK": 685,
    "nombre": "685",
    "longitud": -73.686355,
    "latitud": 9.059319
  },
  {
    "PK": 686,
    "nombre": "686",
    "longitud": -73.689548,
    "latitud": 9.06776
  },
  {
    "PK": 687,
    "nombre": "687",
    "longitud": -73.690494,
    "latitud": 9.076752
  },
  {
    "PK": 688,
    "nombre": "688",
    "longitud": -73.689924,
    "latitud": 9.085573
  },
  {
    "PK": 689,
    "nombre": "689",
    "longitud": -73.685305,
    "latitud": 9.093343
  },
  {
    "PK": 690,
    "nombre": "690",
    "longitud": -73.681966,
    "latitud": 9.101748
  },
  {
    "PK": 691,
    "nombre": "691",
    "longitud": -73.677387,
    "latitud": 9.109556
  },
  {
    "PK": 692,
    "nombre": "692",
    "longitud": -73.675608,
    "latitud": 9.118377
  },
  {
    "PK": 693,
    "nombre": "693",
    "longitud": -73.673021,
    "latitud": 9.126991
  },
  {
    "PK": 694,
    "nombre": "694",
    "longitud": -73.669384,
    "latitud": 9.135279
  },
  {
    "PK": 695,
    "nombre": "695",
    "longitud": -73.66575,
    "latitud": 9.143567
  },
  {
    "PK": 696,
    "nombre": "696",
    "longitud": -73.662116,
    "latitud": 9.151856
  },
  {
    "PK": 697,
    "nombre": "697",
    "longitud": -73.658482,
    "latitud": 9.160144
  },
  {
    "PK": 698,
    "nombre": "698",
    "longitud": -73.654847,
    "latitud": 9.168432
  },
  {
    "PK": 699,
    "nombre": "699",
    "longitud": -73.651211,
    "latitud": 9.17672
  },
  {
    "PK": 700,
    "nombre": "700",
    "longitud": -73.648743,
    "latitud": 9.185388
  },
  {
    "PK": 701,
    "nombre": "701",
    "longitud": -73.645304,
    "latitud": 9.1934
  },
  {
    "PK": 702,
    "nombre": "702",
    "longitud": -73.637986,
    "latitud": 9.198773
  },
  {
    "PK": 703,
    "nombre": "703",
    "longitud": -73.630668,
    "latitud": 9.204145
  },
  {
    "PK": 704,
    "nombre": "704",
    "longitud": -73.623349,
    "latitud": 9.209517
  },
  {
    "PK": 705,
    "nombre": "705",
    "longitud": -73.616034,
    "latitud": 9.214895
  },
  {
    "PK": 706,
    "nombre": "706",
    "longitud": -73.608713,
    "latitud": 9.220264
  },
  {
    "PK": 707,
    "nombre": "707",
    "longitud": -73.601396,
    "latitud": 9.225638
  },
  {
    "PK": 708,
    "nombre": "708",
    "longitud": -73.594409,
    "latitud": 9.231343
  },
  {
    "PK": 709,
    "nombre": "709",
    "longitud": -73.592158,
    "latitud": 9.240075
  },
  {
    "PK": 710,
    "nombre": "710",
    "longitud": -73.590179,
    "latitud": 9.2489
  },
  {
    "PK": 711,
    "nombre": "711",
    "longitud": -73.588201,
    "latitud": 9.257725
  },
  {
    "PK": 712,
    "nombre": "712",
    "longitud": -73.586219,
    "latitud": 9.266549
  },
  {
    "PK": 713,
    "nombre": "713",
    "longitud": -73.58424,
    "latitud": 9.275374
  },
  {
    "PK": 714,
    "nombre": "714",
    "longitud": -73.582261,
    "latitud": 9.284198
  },
  {
    "PK": 715,
    "nombre": "715",
    "longitud": -73.58027,
    "latitud": 9.29302
  },
  {
    "PK": 716,
    "nombre": "716",
    "longitud": -73.578288,
    "latitud": 9.301844
  },
  {
    "PK": 717,
    "nombre": "717",
    "longitud": -73.576305,
    "latitud": 9.310668
  },
  {
    "PK": 718,
    "nombre": "718",
    "longitud": -73.574325,
    "latitud": 9.319492
  },
  {
    "PK": 719,
    "nombre": "719",
    "longitud": -73.572342,
    "latitud": 9.328316
  },
  {
    "PK": 720,
    "nombre": "720",
    "longitud": -73.5672693,
    "latitud": 9.3329053
  },
  {
    "PK": 721,
    "nombre": "721",
    "longitud": -73.568375,
    "latitud": 9.345964
  },
  {
    "PK": 722,
    "nombre": "722",
    "longitud": -73.566393,
    "latitud": 9.354788
  },
  {
    "PK": "722+338",
    "nombre": "722+338",
    "longitud": -73.565722,
    "latitud": 9.357773
  },
  {
    "PK": 236,
    "nombre": "236",
    "longitud": -74.679983,
    "latitud": 5.757799
  }
];

// Exponer globalmente
if (typeof window !== 'undefined') {
    window.coordenadasKML = coordenadasKML;
}