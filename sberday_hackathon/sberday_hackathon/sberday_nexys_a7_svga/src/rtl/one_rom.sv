module one_rom (                       //невскрытая клетка
  input  wire    [10:0]     addr,
  output wire    [11:0]     word
);

  logic [11:0] rom [(1025)];

  assign word = rom[addr];

  initial begin
rom[0] = 12'h777;
rom[1] = 12'h777;
rom[2] = 12'h777;
rom[3] = 12'h777;
rom[4] = 12'h777;
rom[5] = 12'h777;
rom[6] = 12'h777;
rom[7] = 12'h777;
rom[8] = 12'h777;
rom[9] = 12'h777;
rom[10] = 12'h777;
rom[11] = 12'h777;
rom[12] = 12'h777;
rom[13] = 12'h777;
rom[14] = 12'h777;
rom[15] = 12'h777;
rom[16] = 12'h777;
rom[17] = 12'h777;
rom[18] = 12'h777;
rom[19] = 12'h777;
rom[20] = 12'h777;
rom[21] = 12'h777;
rom[22] = 12'h777;
rom[23] = 12'h777;
rom[24] = 12'h777;
rom[25] = 12'h777;
rom[26] = 12'h777;
rom[27] = 12'h777;
rom[28] = 12'h777;
rom[29] = 12'h777;
rom[30] = 12'h777;
rom[31] = 12'h777;
rom[32] = 12'h777;
rom[33] = 12'hccc;
rom[34] = 12'hccc;
rom[35] = 12'hccc;
rom[36] = 12'hccc;
rom[37] = 12'hccc;
rom[38] = 12'hccc;
rom[39] = 12'hccc;
rom[40] = 12'hccc;
rom[41] = 12'hccc;
rom[42] = 12'hccc;
rom[43] = 12'hccc;
rom[44] = 12'hccc;
rom[45] = 12'hccc;
rom[46] = 12'hccc;
rom[47] = 12'hccc;
rom[48] = 12'hccc;
rom[49] = 12'hccc;
rom[50] = 12'hccc;
rom[51] = 12'hccc;
rom[52] = 12'hccc;
rom[53] = 12'hccc;
rom[54] = 12'hccc;
rom[55] = 12'hccc;
rom[56] = 12'hccc;
rom[57] = 12'hccc;
rom[58] = 12'hccc;
rom[59] = 12'hccc;
rom[60] = 12'hccc;
rom[61] = 12'hccc;
rom[62] = 12'hccc;
rom[63] = 12'h777;
rom[64] = 12'h777;
rom[65] = 12'hccc;
rom[66] = 12'hccc;
rom[67] = 12'hccc;
rom[68] = 12'hccc;
rom[69] = 12'hccc;
rom[70] = 12'hccc;
rom[71] = 12'hccc;
rom[72] = 12'hccc;
rom[73] = 12'hccc;
rom[74] = 12'hccc;
rom[75] = 12'hccc;
rom[76] = 12'hccc;
rom[77] = 12'hccc;
rom[78] = 12'hccc;
rom[79] = 12'hccc;
rom[80] = 12'hccc;
rom[81] = 12'hccc;
rom[82] = 12'hccc;
rom[83] = 12'hccc;
rom[84] = 12'hccc;
rom[85] = 12'hccc;
rom[86] = 12'hccc;
rom[87] = 12'hccc;
rom[88] = 12'hccc;
rom[89] = 12'hccc;
rom[90] = 12'hccc;
rom[91] = 12'hccc;
rom[92] = 12'hccc;
rom[93] = 12'hccc;
rom[94] = 12'hccc;
rom[95] = 12'h777;
rom[96] = 12'h777;
rom[97] = 12'hccc;
rom[98] = 12'hccc;
rom[99] = 12'hccc;
rom[100] = 12'hccc;
rom[101] = 12'hccc;
rom[102] = 12'hccc;
rom[103] = 12'hccc;
rom[104] = 12'hccc;
rom[105] = 12'hccc;
rom[106] = 12'hccc;
rom[107] = 12'hccc;
rom[108] = 12'hccc;
rom[109] = 12'hccc;
rom[110] = 12'hccc;
rom[111] = 12'hccc;
rom[112] = 12'hccc;
rom[113] = 12'hccc;
rom[114] = 12'hccc;
rom[115] = 12'hccc;
rom[116] = 12'hccc;
rom[117] = 12'hccc;
rom[118] = 12'hccc;
rom[119] = 12'hccc;
rom[120] = 12'hccc;
rom[121] = 12'hccc;
rom[122] = 12'hccc;
rom[123] = 12'hccc;
rom[124] = 12'hccc;
rom[125] = 12'hccc;
rom[126] = 12'hccc;
rom[127] = 12'h777;
rom[128] = 12'h777;
rom[129] = 12'hccc;
rom[130] = 12'hccc;
rom[131] = 12'hccc;
rom[132] = 12'hccc;
rom[133] = 12'hccc;
rom[134] = 12'hccc;
rom[135] = 12'hccc;
rom[136] = 12'hccc;
rom[137] = 12'hccc;
rom[138] = 12'hccc;
rom[139] = 12'hccc;
rom[140] = 12'hccc;
rom[141] = 12'hccc;
rom[142] = 12'hccc;
rom[143] = 12'hccc;
rom[144] = 12'hccc;
rom[145] = 12'hccc;
rom[146] = 12'hccc;
rom[147] = 12'hccc;
rom[148] = 12'hccc;
rom[149] = 12'hccc;
rom[150] = 12'hccc;
rom[151] = 12'hccc;
rom[152] = 12'hccc;
rom[153] = 12'hccc;
rom[154] = 12'hccc;
rom[155] = 12'hccc;
rom[156] = 12'hccc;
rom[157] = 12'hccc;
rom[158] = 12'hccc;
rom[159] = 12'h777;
rom[160] = 12'h777;
rom[161] = 12'hccc;
rom[162] = 12'hccc;
rom[163] = 12'hccc;
rom[164] = 12'hccc;
rom[165] = 12'hccc;
rom[166] = 12'hccc;
rom[167] = 12'hccc;
rom[168] = 12'hccc;
rom[169] = 12'hccc;
rom[170] = 12'hccc;
rom[171] = 12'hccc;
rom[172] = 12'hccc;
rom[173] = 12'hccc;
rom[174] = 12'hccc;
rom[175] = 12'hccc;
rom[176] = 12'hccc;
rom[177] = 12'hccc;
rom[178] = 12'hccc;
rom[179] = 12'hccc;
rom[180] = 12'hccc;
rom[181] = 12'hccc;
rom[182] = 12'hccc;
rom[183] = 12'hccc;
rom[184] = 12'hccc;
rom[185] = 12'hccc;
rom[186] = 12'hccc;
rom[187] = 12'hccc;
rom[188] = 12'hccc;
rom[189] = 12'hccc;
rom[190] = 12'hccc;
rom[191] = 12'h777;
rom[192] = 12'h777;
rom[193] = 12'hccc;
rom[194] = 12'hccc;
rom[195] = 12'hccc;
rom[196] = 12'hccc;
rom[197] = 12'hccc;
rom[198] = 12'hccc;
rom[199] = 12'hccc;
rom[200] = 12'hccc;
rom[201] = 12'hccc;
rom[202] = 12'hccc;
rom[203] = 12'hccc;
rom[204] = 12'hccc;
rom[205] = 12'hccc;
rom[206] = 12'hccc;
rom[207] = 12'hccc;
rom[208] = 12'hccc;
rom[209] = 12'hccc;
rom[210] = 12'hccc;
rom[211] = 12'hccc;
rom[212] = 12'hccc;
rom[213] = 12'hccc;
rom[214] = 12'hccc;
rom[215] = 12'hccc;
rom[216] = 12'hccc;
rom[217] = 12'hccc;
rom[218] = 12'hccc;
rom[219] = 12'hccc;
rom[220] = 12'hccc;
rom[221] = 12'hccc;
rom[222] = 12'hccc;
rom[223] = 12'h777;
rom[224] = 12'h777;
rom[225] = 12'hccc;
rom[226] = 12'hccc;
rom[227] = 12'hccc;
rom[228] = 12'hccc;
rom[229] = 12'hccc;
rom[230] = 12'hccc;
rom[231] = 12'hccc;
rom[232] = 12'hccc;
rom[233] = 12'hccc;
rom[234] = 12'hccc;
rom[235] = 12'hccc;
rom[236] = 12'hccc;
rom[237] = 12'hccc;
rom[238] = 12'hccc;
rom[239] = 12'hccc;
rom[240] = 12'hccc;
rom[241] = 12'hccc;
rom[242] = 12'hccc;
rom[243] = 12'hccc;
rom[244] = 12'hccc;
rom[245] = 12'hccc;
rom[246] = 12'hccc;
rom[247] = 12'hccc;
rom[248] = 12'hccc;
rom[249] = 12'hccc;
rom[250] = 12'hccc;
rom[251] = 12'hccc;
rom[252] = 12'hccc;
rom[253] = 12'hccc;
rom[254] = 12'hccc;
rom[255] = 12'h777;
rom[256] = 12'h777;
rom[257] = 12'hccc;
rom[258] = 12'hccc;
rom[259] = 12'hccc;
rom[260] = 12'hccc;
rom[261] = 12'hccc;
rom[262] = 12'hccc;
rom[263] = 12'hccc;
rom[264] = 12'hccc;
rom[265] = 12'hccc;
rom[266] = 12'hccc;
rom[267] = 12'hccc;
rom[268] = 12'hccc;
rom[269] = 12'hccc;
rom[270] = 12'hccc;
rom[271] = 12'hccc;
rom[272] = 12'hccc;
rom[273] = 12'hccc;
rom[274] = 12'hccc;
rom[275] = 12'hccc;
rom[276] = 12'hccc;
rom[277] = 12'hccc;
rom[278] = 12'hccc;
rom[279] = 12'hccc;
rom[280] = 12'hccc;
rom[281] = 12'hccc;
rom[282] = 12'hccc;
rom[283] = 12'hccc;
rom[284] = 12'hccc;
rom[285] = 12'hccc;
rom[286] = 12'hccc;
rom[287] = 12'h777;
rom[288] = 12'h777;
rom[289] = 12'hccc;
rom[290] = 12'hccc;
rom[291] = 12'hccc;
rom[292] = 12'hccc;
rom[293] = 12'hccc;
rom[294] = 12'hccc;
rom[295] = 12'hccc;
rom[296] = 12'hccc;
rom[297] = 12'hccc;
rom[298] = 12'hccc;
rom[299] = 12'hccc;
rom[300] = 12'hccc;
rom[301] = 12'hccc;
rom[302] = 12'hccc;
rom[303] = 12'hf00;
rom[304] = 12'hf00;
rom[305] = 12'hf00;
rom[306] = 12'hccc;
rom[307] = 12'hccc;
rom[308] = 12'hccc;
rom[309] = 12'hccc;
rom[310] = 12'hccc;
rom[311] = 12'hccc;
rom[312] = 12'hccc;
rom[313] = 12'hccc;
rom[314] = 12'hccc;
rom[315] = 12'hccc;
rom[316] = 12'hccc;
rom[317] = 12'hccc;
rom[318] = 12'hccc;
rom[319] = 12'h777;
rom[320] = 12'h777;
rom[321] = 12'hccc;
rom[322] = 12'hccc;
rom[323] = 12'hccc;
rom[324] = 12'hccc;
rom[325] = 12'hccc;
rom[326] = 12'hccc;
rom[327] = 12'hccc;
rom[328] = 12'hccc;
rom[329] = 12'hccc;
rom[330] = 12'hccc;
rom[331] = 12'hccc;
rom[332] = 12'hccc;
rom[333] = 12'hccc;
rom[334] = 12'hf00;
rom[335] = 12'hf00;
rom[336] = 12'hf00;
rom[337] = 12'hf00;
rom[338] = 12'hccc;
rom[339] = 12'hccc;
rom[340] = 12'hccc;
rom[341] = 12'hccc;
rom[342] = 12'hccc;
rom[343] = 12'hccc;
rom[344] = 12'hccc;
rom[345] = 12'hccc;
rom[346] = 12'hccc;
rom[347] = 12'hccc;
rom[348] = 12'hccc;
rom[349] = 12'hccc;
rom[350] = 12'hccc;
rom[351] = 12'h777;
rom[352] = 12'h777;
rom[353] = 12'hccc;
rom[354] = 12'hccc;
rom[355] = 12'hccc;
rom[356] = 12'hccc;
rom[357] = 12'hccc;
rom[358] = 12'hccc;
rom[359] = 12'hccc;
rom[360] = 12'hccc;
rom[361] = 12'hccc;
rom[362] = 12'hccc;
rom[363] = 12'hccc;
rom[364] = 12'hccc;
rom[365] = 12'hccc;
rom[366] = 12'hf00;
rom[367] = 12'hf00;
rom[368] = 12'hf00;
rom[369] = 12'hf00;
rom[370] = 12'hccc;
rom[371] = 12'hccc;
rom[372] = 12'hccc;
rom[373] = 12'hccc;
rom[374] = 12'hccc;
rom[375] = 12'hccc;
rom[376] = 12'hccc;
rom[377] = 12'hccc;
rom[378] = 12'hccc;
rom[379] = 12'hccc;
rom[380] = 12'hccc;
rom[381] = 12'hccc;
rom[382] = 12'hccc;
rom[383] = 12'h777;
rom[384] = 12'h777;
rom[385] = 12'hccc;
rom[386] = 12'hccc;
rom[387] = 12'hccc;
rom[388] = 12'hccc;
rom[389] = 12'hccc;
rom[390] = 12'hccc;
rom[391] = 12'hccc;
rom[392] = 12'hccc;
rom[393] = 12'hccc;
rom[394] = 12'hccc;
rom[395] = 12'hccc;
rom[396] = 12'hccc;
rom[397] = 12'hf00;
rom[398] = 12'hf00;
rom[399] = 12'hf00;
rom[400] = 12'hf00;
rom[401] = 12'hf00;
rom[402] = 12'hccc;
rom[403] = 12'hccc;
rom[404] = 12'hccc;
rom[405] = 12'hccc;
rom[406] = 12'hccc;
rom[407] = 12'hccc;
rom[408] = 12'hccc;
rom[409] = 12'hccc;
rom[410] = 12'hccc;
rom[411] = 12'hccc;
rom[412] = 12'hccc;
rom[413] = 12'hccc;
rom[414] = 12'hccc;
rom[415] = 12'h777;
rom[416] = 12'h777;
rom[417] = 12'hccc;
rom[418] = 12'hccc;
rom[419] = 12'hccc;
rom[420] = 12'hccc;
rom[421] = 12'hccc;
rom[422] = 12'hccc;
rom[423] = 12'hccc;
rom[424] = 12'hccc;
rom[425] = 12'hccc;
rom[426] = 12'hccc;
rom[427] = 12'hccc;
rom[428] = 12'hf00;
rom[429] = 12'hf00;
rom[430] = 12'hf00;
rom[431] = 12'hf00;
rom[432] = 12'hf00;
rom[433] = 12'hf00;
rom[434] = 12'hccc;
rom[435] = 12'hccc;
rom[436] = 12'hccc;
rom[437] = 12'hccc;
rom[438] = 12'hccc;
rom[439] = 12'hccc;
rom[440] = 12'hccc;
rom[441] = 12'hccc;
rom[442] = 12'hccc;
rom[443] = 12'hccc;
rom[444] = 12'hccc;
rom[445] = 12'hccc;
rom[446] = 12'hccc;
rom[447] = 12'h777;
rom[448] = 12'h777;
rom[449] = 12'hccc;
rom[450] = 12'hccc;
rom[451] = 12'hccc;
rom[452] = 12'hccc;
rom[453] = 12'hccc;
rom[454] = 12'hccc;
rom[455] = 12'hccc;
rom[456] = 12'hccc;
rom[457] = 12'hccc;
rom[458] = 12'hccc;
rom[459] = 12'hccc;
rom[460] = 12'hccc;
rom[461] = 12'hccc;
rom[462] = 12'hf00;
rom[463] = 12'hf00;
rom[464] = 12'hf00;
rom[465] = 12'hf00;
rom[466] = 12'hccc;
rom[467] = 12'hccc;
rom[468] = 12'hccc;
rom[469] = 12'hccc;
rom[470] = 12'hccc;
rom[471] = 12'hccc;
rom[472] = 12'hccc;
rom[473] = 12'hccc;
rom[474] = 12'hccc;
rom[475] = 12'hccc;
rom[476] = 12'hccc;
rom[477] = 12'hccc;
rom[478] = 12'hccc;
rom[479] = 12'h777;
rom[480] = 12'h777;
rom[481] = 12'hccc;
rom[482] = 12'hccc;
rom[483] = 12'hccc;
rom[484] = 12'hccc;
rom[485] = 12'hccc;
rom[486] = 12'hccc;
rom[487] = 12'hccc;
rom[488] = 12'hccc;
rom[489] = 12'hccc;
rom[490] = 12'hccc;
rom[491] = 12'hccc;
rom[492] = 12'hccc;
rom[493] = 12'hccc;
rom[494] = 12'hf00;
rom[495] = 12'hf00;
rom[496] = 12'hf00;
rom[497] = 12'hf00;
rom[498] = 12'hccc;
rom[499] = 12'hccc;
rom[500] = 12'hccc;
rom[501] = 12'hccc;
rom[502] = 12'hccc;
rom[503] = 12'hccc;
rom[504] = 12'hccc;
rom[505] = 12'hccc;
rom[506] = 12'hccc;
rom[507] = 12'hccc;
rom[508] = 12'hccc;
rom[509] = 12'hccc;
rom[510] = 12'hccc;
rom[511] = 12'h777;
rom[512] = 12'h777;
rom[513] = 12'hccc;
rom[514] = 12'hccc;
rom[515] = 12'hccc;
rom[516] = 12'hccc;
rom[517] = 12'hccc;
rom[518] = 12'hccc;
rom[519] = 12'hccc;
rom[520] = 12'hccc;
rom[521] = 12'hccc;
rom[522] = 12'hccc;
rom[523] = 12'hccc;
rom[524] = 12'hccc;
rom[525] = 12'hccc;
rom[526] = 12'hf00;
rom[527] = 12'hf00;
rom[528] = 12'hf00;
rom[529] = 12'hf00;
rom[530] = 12'hccc;
rom[531] = 12'hccc;
rom[532] = 12'hccc;
rom[533] = 12'hccc;
rom[534] = 12'hccc;
rom[535] = 12'hccc;
rom[536] = 12'hccc;
rom[537] = 12'hccc;
rom[538] = 12'hccc;
rom[539] = 12'hccc;
rom[540] = 12'hccc;
rom[541] = 12'hccc;
rom[542] = 12'hccc;
rom[543] = 12'h777;
rom[544] = 12'h777;
rom[545] = 12'hccc;
rom[546] = 12'hccc;
rom[547] = 12'hccc;
rom[548] = 12'hccc;
rom[549] = 12'hccc;
rom[550] = 12'hccc;
rom[551] = 12'hccc;
rom[552] = 12'hccc;
rom[553] = 12'hccc;
rom[554] = 12'hccc;
rom[555] = 12'hccc;
rom[556] = 12'hccc;
rom[557] = 12'hccc;
rom[558] = 12'hf00;
rom[559] = 12'hf00;
rom[560] = 12'hf00;
rom[561] = 12'hf00;
rom[562] = 12'hccc;
rom[563] = 12'hccc;
rom[564] = 12'hccc;
rom[565] = 12'hccc;
rom[566] = 12'hccc;
rom[567] = 12'hccc;
rom[568] = 12'hccc;
rom[569] = 12'hccc;
rom[570] = 12'hccc;
rom[571] = 12'hccc;
rom[572] = 12'hccc;
rom[573] = 12'hccc;
rom[574] = 12'hccc;
rom[575] = 12'h777;
rom[576] = 12'h777;
rom[577] = 12'hccc;
rom[578] = 12'hccc;
rom[579] = 12'hccc;
rom[580] = 12'hccc;
rom[581] = 12'hccc;
rom[582] = 12'hccc;
rom[583] = 12'hccc;
rom[584] = 12'hccc;
rom[585] = 12'hccc;
rom[586] = 12'hccc;
rom[587] = 12'hccc;
rom[588] = 12'hccc;
rom[589] = 12'hccc;
rom[590] = 12'hf00;
rom[591] = 12'hf00;
rom[592] = 12'hf00;
rom[593] = 12'hf00;
rom[594] = 12'hccc;
rom[595] = 12'hccc;
rom[596] = 12'hccc;
rom[597] = 12'hccc;
rom[598] = 12'hccc;
rom[599] = 12'hccc;
rom[600] = 12'hccc;
rom[601] = 12'hccc;
rom[602] = 12'hccc;
rom[603] = 12'hccc;
rom[604] = 12'hccc;
rom[605] = 12'hccc;
rom[606] = 12'hccc;
rom[607] = 12'h777;
rom[608] = 12'h777;
rom[609] = 12'hccc;
rom[610] = 12'hccc;
rom[611] = 12'hccc;
rom[612] = 12'hccc;
rom[613] = 12'hccc;
rom[614] = 12'hccc;
rom[615] = 12'hccc;
rom[616] = 12'hccc;
rom[617] = 12'hccc;
rom[618] = 12'hccc;
rom[619] = 12'hccc;
rom[620] = 12'hf00;
rom[621] = 12'hf00;
rom[622] = 12'hf00;
rom[623] = 12'hf00;
rom[624] = 12'hf00;
rom[625] = 12'hf00;
rom[626] = 12'hf00;
rom[627] = 12'hf00;
rom[628] = 12'hccc;
rom[629] = 12'hccc;
rom[630] = 12'hccc;
rom[631] = 12'hccc;
rom[632] = 12'hccc;
rom[633] = 12'hccc;
rom[634] = 12'hccc;
rom[635] = 12'hccc;
rom[636] = 12'hccc;
rom[637] = 12'hccc;
rom[638] = 12'hccc;
rom[639] = 12'h777;
rom[640] = 12'h777;
rom[641] = 12'hccc;
rom[642] = 12'hccc;
rom[643] = 12'hccc;
rom[644] = 12'hccc;
rom[645] = 12'hccc;
rom[646] = 12'hccc;
rom[647] = 12'hccc;
rom[648] = 12'hccc;
rom[649] = 12'hccc;
rom[650] = 12'hccc;
rom[651] = 12'hccc;
rom[652] = 12'hf00;
rom[653] = 12'hf00;
rom[654] = 12'hf00;
rom[655] = 12'hf00;
rom[656] = 12'hf00;
rom[657] = 12'hf00;
rom[658] = 12'hf00;
rom[659] = 12'hf00;
rom[660] = 12'hccc;
rom[661] = 12'hccc;
rom[662] = 12'hccc;
rom[663] = 12'hccc;
rom[664] = 12'hccc;
rom[665] = 12'hccc;
rom[666] = 12'hccc;
rom[667] = 12'hccc;
rom[668] = 12'hccc;
rom[669] = 12'hccc;
rom[670] = 12'hccc;
rom[671] = 12'h777;
rom[672] = 12'h777;
rom[673] = 12'hccc;
rom[674] = 12'hccc;
rom[675] = 12'hccc;
rom[676] = 12'hccc;
rom[677] = 12'hccc;
rom[678] = 12'hccc;
rom[679] = 12'hccc;
rom[680] = 12'hccc;
rom[681] = 12'hccc;
rom[682] = 12'hccc;
rom[683] = 12'hccc;
rom[684] = 12'hf00;
rom[685] = 12'hf00;
rom[686] = 12'hf00;
rom[687] = 12'hf00;
rom[688] = 12'hf00;
rom[689] = 12'hf00;
rom[690] = 12'hf00;
rom[691] = 12'hf00;
rom[692] = 12'hccc;
rom[693] = 12'hccc;
rom[694] = 12'hccc;
rom[695] = 12'hccc;
rom[696] = 12'hccc;
rom[697] = 12'hccc;
rom[698] = 12'hccc;
rom[699] = 12'hccc;
rom[700] = 12'hccc;
rom[701] = 12'hccc;
rom[702] = 12'hccc;
rom[703] = 12'h777;
rom[704] = 12'h777;
rom[705] = 12'hccc;
rom[706] = 12'hccc;
rom[707] = 12'hccc;
rom[708] = 12'hccc;
rom[709] = 12'hccc;
rom[710] = 12'hccc;
rom[711] = 12'hccc;
rom[712] = 12'hccc;
rom[713] = 12'hccc;
rom[714] = 12'hccc;
rom[715] = 12'hccc;
rom[716] = 12'hccc;
rom[717] = 12'hccc;
rom[718] = 12'hccc;
rom[719] = 12'hccc;
rom[720] = 12'hccc;
rom[721] = 12'hccc;
rom[722] = 12'hccc;
rom[723] = 12'hbbb;
rom[724] = 12'hccc;
rom[725] = 12'hccc;
rom[726] = 12'hccc;
rom[727] = 12'hccc;
rom[728] = 12'hccc;
rom[729] = 12'hccc;
rom[730] = 12'hccc;
rom[731] = 12'hccc;
rom[732] = 12'hccc;
rom[733] = 12'hccc;
rom[734] = 12'hccc;
rom[735] = 12'h777;
rom[736] = 12'h777;
rom[737] = 12'hccc;
rom[738] = 12'hccc;
rom[739] = 12'hccc;
rom[740] = 12'hccc;
rom[741] = 12'hccc;
rom[742] = 12'hccc;
rom[743] = 12'hccc;
rom[744] = 12'hccc;
rom[745] = 12'hccc;
rom[746] = 12'hccc;
rom[747] = 12'hccc;
rom[748] = 12'hccc;
rom[749] = 12'hccc;
rom[750] = 12'hccc;
rom[751] = 12'hccc;
rom[752] = 12'hccc;
rom[753] = 12'hccc;
rom[754] = 12'hccc;
rom[755] = 12'hbbb;
rom[756] = 12'hccc;
rom[757] = 12'hccc;
rom[758] = 12'hccc;
rom[759] = 12'hccc;
rom[760] = 12'hccc;
rom[761] = 12'hccc;
rom[762] = 12'hccc;
rom[763] = 12'hccc;
rom[764] = 12'hccc;
rom[765] = 12'hccc;
rom[766] = 12'hccc;
rom[767] = 12'h777;
rom[768] = 12'h777;
rom[769] = 12'hccc;
rom[770] = 12'hccc;
rom[771] = 12'hccc;
rom[772] = 12'hccc;
rom[773] = 12'hccc;
rom[774] = 12'hccc;
rom[775] = 12'hccc;
rom[776] = 12'hccc;
rom[777] = 12'hccc;
rom[778] = 12'hccc;
rom[779] = 12'hccc;
rom[780] = 12'hccc;
rom[781] = 12'hccc;
rom[782] = 12'hccc;
rom[783] = 12'hccc;
rom[784] = 12'hccc;
rom[785] = 12'hccc;
rom[786] = 12'hccc;
rom[787] = 12'hccc;
rom[788] = 12'hccc;
rom[789] = 12'hccc;
rom[790] = 12'hccc;
rom[791] = 12'hccc;
rom[792] = 12'hccc;
rom[793] = 12'hccc;
rom[794] = 12'hccc;
rom[795] = 12'hccc;
rom[796] = 12'hccc;
rom[797] = 12'hccc;
rom[798] = 12'hccc;
rom[799] = 12'h777;
rom[800] = 12'h777;
rom[801] = 12'hccc;
rom[802] = 12'hccc;
rom[803] = 12'hccc;
rom[804] = 12'hccc;
rom[805] = 12'hccc;
rom[806] = 12'hccc;
rom[807] = 12'hccc;
rom[808] = 12'hccc;
rom[809] = 12'hccc;
rom[810] = 12'hccc;
rom[811] = 12'hccc;
rom[812] = 12'hccc;
rom[813] = 12'hccc;
rom[814] = 12'hccc;
rom[815] = 12'hccc;
rom[816] = 12'hccc;
rom[817] = 12'hccc;
rom[818] = 12'hccc;
rom[819] = 12'hccc;
rom[820] = 12'hccc;
rom[821] = 12'hccc;
rom[822] = 12'hccc;
rom[823] = 12'hccc;
rom[824] = 12'hccc;
rom[825] = 12'hccc;
rom[826] = 12'hccc;
rom[827] = 12'hccc;
rom[828] = 12'hccc;
rom[829] = 12'hccc;
rom[830] = 12'hccc;
rom[831] = 12'h777;
rom[832] = 12'h777;
rom[833] = 12'hccc;
rom[834] = 12'hccc;
rom[835] = 12'hccc;
rom[836] = 12'hccc;
rom[837] = 12'hccc;
rom[838] = 12'hccc;
rom[839] = 12'hccc;
rom[840] = 12'hccc;
rom[841] = 12'hccc;
rom[842] = 12'hccc;
rom[843] = 12'hccc;
rom[844] = 12'hccc;
rom[845] = 12'hccc;
rom[846] = 12'hccc;
rom[847] = 12'hccc;
rom[848] = 12'hccc;
rom[849] = 12'hccc;
rom[850] = 12'hccc;
rom[851] = 12'hccc;
rom[852] = 12'hccc;
rom[853] = 12'hccc;
rom[854] = 12'hccc;
rom[855] = 12'hccc;
rom[856] = 12'hccc;
rom[857] = 12'hccc;
rom[858] = 12'hccc;
rom[859] = 12'hccc;
rom[860] = 12'hccc;
rom[861] = 12'hccc;
rom[862] = 12'hccc;
rom[863] = 12'h777;
rom[864] = 12'h777;
rom[865] = 12'hccc;
rom[866] = 12'hccc;
rom[867] = 12'hccc;
rom[868] = 12'hccc;
rom[869] = 12'hccc;
rom[870] = 12'hccc;
rom[871] = 12'hccc;
rom[872] = 12'hccc;
rom[873] = 12'hccc;
rom[874] = 12'hccc;
rom[875] = 12'hccc;
rom[876] = 12'hccc;
rom[877] = 12'hccc;
rom[878] = 12'hccc;
rom[879] = 12'hccc;
rom[880] = 12'hccc;
rom[881] = 12'hccc;
rom[882] = 12'hccc;
rom[883] = 12'hccc;
rom[884] = 12'hccc;
rom[885] = 12'hccc;
rom[886] = 12'hccc;
rom[887] = 12'hccc;
rom[888] = 12'hccc;
rom[889] = 12'hccc;
rom[890] = 12'hccc;
rom[891] = 12'hccc;
rom[892] = 12'hccc;
rom[893] = 12'hccc;
rom[894] = 12'hccc;
rom[895] = 12'h777;
rom[896] = 12'h777;
rom[897] = 12'hccc;
rom[898] = 12'hccc;
rom[899] = 12'hccc;
rom[900] = 12'hccc;
rom[901] = 12'hccc;
rom[902] = 12'hccc;
rom[903] = 12'hccc;
rom[904] = 12'hccc;
rom[905] = 12'hccc;
rom[906] = 12'hccc;
rom[907] = 12'hccc;
rom[908] = 12'hccc;
rom[909] = 12'hccc;
rom[910] = 12'hccc;
rom[911] = 12'hccc;
rom[912] = 12'hccc;
rom[913] = 12'hccc;
rom[914] = 12'hccc;
rom[915] = 12'hccc;
rom[916] = 12'hccc;
rom[917] = 12'hccc;
rom[918] = 12'hccc;
rom[919] = 12'hccc;
rom[920] = 12'hccc;
rom[921] = 12'hccc;
rom[922] = 12'hccc;
rom[923] = 12'hccc;
rom[924] = 12'hccc;
rom[925] = 12'hccc;
rom[926] = 12'hccc;
rom[927] = 12'h777;
rom[928] = 12'h777;
rom[929] = 12'hccc;
rom[930] = 12'hccc;
rom[931] = 12'hccc;
rom[932] = 12'hccc;
rom[933] = 12'hccc;
rom[934] = 12'hccc;
rom[935] = 12'hccc;
rom[936] = 12'hccc;
rom[937] = 12'hccc;
rom[938] = 12'hccc;
rom[939] = 12'hccc;
rom[940] = 12'hccc;
rom[941] = 12'hccc;
rom[942] = 12'hccc;
rom[943] = 12'hccc;
rom[944] = 12'hccc;
rom[945] = 12'hccc;
rom[946] = 12'hccc;
rom[947] = 12'hccc;
rom[948] = 12'hccc;
rom[949] = 12'hccc;
rom[950] = 12'hccc;
rom[951] = 12'hccc;
rom[952] = 12'hccc;
rom[953] = 12'hccc;
rom[954] = 12'hccc;
rom[955] = 12'hccc;
rom[956] = 12'hccc;
rom[957] = 12'hccc;
rom[958] = 12'hccc;
rom[959] = 12'h777;
rom[960] = 12'h777;
rom[961] = 12'hccc;
rom[962] = 12'hccc;
rom[963] = 12'hccc;
rom[964] = 12'hccc;
rom[965] = 12'hccc;
rom[966] = 12'hccc;
rom[967] = 12'hccc;
rom[968] = 12'hccc;
rom[969] = 12'hccc;
rom[970] = 12'hccc;
rom[971] = 12'hccc;
rom[972] = 12'hccc;
rom[973] = 12'hccc;
rom[974] = 12'hccc;
rom[975] = 12'hccc;
rom[976] = 12'hccc;
rom[977] = 12'hccc;
rom[978] = 12'hccc;
rom[979] = 12'hccc;
rom[980] = 12'hccc;
rom[981] = 12'hccc;
rom[982] = 12'hccc;
rom[983] = 12'hccc;
rom[984] = 12'hccc;
rom[985] = 12'hccc;
rom[986] = 12'hccc;
rom[987] = 12'hccc;
rom[988] = 12'hccc;
rom[989] = 12'hccc;
rom[990] = 12'hccc;
rom[991] = 12'h777;
rom[992] = 12'h777;
rom[993] = 12'h777;
rom[994] = 12'h777;
rom[995] = 12'h777;
rom[996] = 12'h777;
rom[997] = 12'h777;
rom[998] = 12'h777;
rom[999] = 12'h777;
rom[1000] = 12'h777;
rom[1001] = 12'h777;
rom[1002] = 12'h777;
rom[1003] = 12'h777;
rom[1004] = 12'h777;
rom[1005] = 12'h777;
rom[1006] = 12'h777;
rom[1007] = 12'h777;
rom[1008] = 12'h777;
rom[1009] = 12'h777;
rom[1010] = 12'h777;
rom[1011] = 12'h777;
rom[1012] = 12'h777;
rom[1013] = 12'h777;
rom[1014] = 12'h777;
rom[1015] = 12'h777;
rom[1016] = 12'h777;
rom[1017] = 12'h777;
rom[1018] = 12'h777;
rom[1019] = 12'h777;
rom[1020] = 12'h777;
rom[1021] = 12'h777;
rom[1022] = 12'h777;
rom[1023] = 12'h777;
  end
endmodule