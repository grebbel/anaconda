class InsertColorReferenceData < ActiveRecord::Migration
  
  def up
    execute <<-eos
    INSERT INTO colors (name, hex, red, green, blue, luminance) 
    VALUES 
    ('indian red','B0171F',176,23,31,69.78),
    ('crimson','DC143C',220,20,60,84.4),
    ('lightpink','FFB6C1',255,182,193,205.11),
    ('lightpink 1','FFAEB9',255,174,185,199.51),
    ('lightpink 2','EEA2AD',238,162,173,186.01),
    ('lightpink 3','CD8C95',205,140,149,160.49),
    ('lightpink 4','8B5F65',139,95,101,108.86),
    ('pink','FFC0CB',255,192,203,212.11),
    ('pink 1','FFB5C5',255,181,197,204.96),
    ('pink 2','EEA9B8',238,169,184,191.35),
    ('pink 3','CD919E',205,145,158,164.43),
    ('pink 4','8B636C',139,99,108,111.99),
    ('palevioletred','DB7093',219,112,147,147.95),
    ('palevioletred 1','FF82AB',255,130,171,172.01),
    ('palevioletred 2','EE799F',238,121,159,160.28),
    ('palevioletred 3','CD6889',205,104,137,137.93),
    ('palevioletred 4','8B475D',139,71,93,93.82),
    ('lavenderblush 1 (lavenderblush)','FFF0F5',255,240,245,245.05),
    ('lavenderblush 2','EEE0E5',238,224,229,228.75),
    ('lavenderblush 3','CDC1C5',205,193,197,197.04),
    ('lavenderblush 4','8B8386',139,131,134,133.73),
    ('violetred 1','FF3E96',255,62,150,129.58),
    ('violetred 2','EE3A8C',238,58,140,121.02),
    ('violetred 3','CD3278',205,50,120,104.2),
    ('violetred 4','8B2252',139,34,82,70.78),
    ('hotpink','FF69B4',255,105,180,158.25),
    ('hotpink 1','FF6EB4',255,110,180,161.2),
    ('hotpink 2','EE6AA7',238,106,167,152.31),
    ('hotpink 3','CD6090',205,96,144,133.98),
    ('hotpink 4','8B3A62',139,58,98,86.7),
    ('raspberry','872657',135,38,87,72.49),
    ('deeppink 1 (deeppink)','FF1493',255,20,147,104.47),
    ('deeppink 2','EE1289',238,18,137,97.09),
    ('deeppink 3','CD1076',205,16,118,83.92),
    ('deeppink 4','8B0A50',139,10,80,56.4),
    ('maroon 1','FF34B3',255,52,179,126.87),
    ('maroon 2','EE30A7',238,48,167,118.09),
    ('maroon 3','CD2990',205,41,144,101.53),
    ('maroon 4','8B1C62',139,28,98,69),
    ('mediumvioletred','C71585',199,21,133,86.72),
    ('violetred','D02090',208,32,144,97.12),
    ('orchid','DA70D6',218,112,214,155.02),
    ('orchid 1','FF83FA',255,131,250,181.29),
    ('orchid 2','EE7AE9',238,122,233,169.01),
    ('orchid 3','CD69C9',205,105,201,145.56),
    ('orchid 4','8B4789',139,71,137,98.66),
    ('thistle','D8BFD8',216,191,216,201.25),
    ('thistle 1','FFE1FF',255,225,255,237.3),
    ('thistle 2','EED2EE',238,210,238,221.48),
    ('thistle 3','CDB5CD',205,181,205,190.84),
    ('thistle 4','8B7B8B',139,123,139,129.56),
    ('plum 1','FFBBFF',255,187,255,214.88),
    ('plum 2','EEAEEE',238,174,238,200.24),
    ('plum 3','CD96CD',205,150,205,172.55),
    ('plum 4','8B668B',139,102,139,117.17),
    ('plum','DDA0DD',221,160,221,185.01),
    ('violet','EE82EE',238,130,238,174.28),
    ('magenta (fuchsia)','FF00FF',255,0,255,104.55),
    ('magenta 2','EE00EE',238,0,238,97.58),
    ('magenta 3','CD00CD',205,0,205,84.05),
    ('magenta 4 (darkmagenta)','8B008B',139,0,139,56.99),
    ('purple','800080',128,0,128,52.48),
    ('mediumorchid','BA55D3',186,85,211,129.16),
    ('mediumorchid 1','E066FF',224,102,255,155.43),
    ('mediumorchid 2','D15FEE',209,95,238,144.93),
    ('mediumorchid 3','B452CD',180,82,205,124.93),
    ('mediumorchid 4','7A378B',122,55,139,84.34),
    ('darkviolet','9400D3',148,0,211,67.61),
    ('darkorchid','9932CC',153,50,204,97.84),
    ('darkorchid 1','BF3EFF',191,62,255,121.93),
    ('darkorchid 2','B23AEE',178,58,238,113.8),
    ('darkorchid 3','9A32CD',154,50,205,98.25),
    ('darkorchid 4','68228B',104,34,139,66.55),
    ('indigo','4B0082',75,0,130,36.8),
    ('blueviolet','8A2BE2',138,43,226,91.63),
    ('purple 1','9B30FF',155,48,255,102.87),
    ('purple 2','912CEE',145,44,238,95.64),
    ('purple 3','7D26CD',125,38,205,82.47),
    ('purple 4','551A8B',85,26,139,56.13),
    ('mediumpurple','9370DB',147,112,219,134.27),
    ('mediumpurple 1','AB82FF',171,130,255,156.05),
    ('mediumpurple 2','9F79EE',159,121,238,145.27),
    ('mediumpurple 3','8968CD',137,104,205,125.01),
    ('mediumpurple 4','5D478B',93,71,139,85.08),
    ('darkslateblue','483D8B',72,61,139,72.88),
    ('lightslateblue','8470FF',132,112,255,133.73),
    ('mediumslateblue','7B68EE',123,104,238,124.44),
    ('slateblue','6A5ACD',106,90,205,107.45),
    ('slateblue 1','836FFF',131,111,255,132.84),
    ('slateblue 2','7A67EE',122,103,238,123.55),
    ('slateblue 3','6959CD',105,89,205,106.56),
    ('slateblue 4','473C8B',71,60,139,71.99),
    ('ghostwhite','F8F8FF',248,248,255,248.77),
    ('lavender','E6E6FA',230,230,250,232.2),
    ('blue','0000FF',0,0,255,28.05),
    ('blue 2','0000EE',0,0,238,26.18),
    ('blue 3 (mediumblue)','0000CD',0,0,205,22.55),
    ('blue 4 (darkblue)','00008B',0,0,139,15.29),
    ('navy','000080',0,0,128,14.08),
    ('midnightblue','191970',25,25,112,34.57),
    ('cobalt','3D59AB',61,89,171,89.62),
    ('royalblue','4169E1',65,105,225,106.2),
    ('royalblue 1','4876FF',72,118,255,119.27),
    ('royalblue 2','436EEE',67,110,238,111.18),
    ('royalblue 3','3A5FCD',58,95,205,96),
    ('royalblue 4','27408B',39,64,139,64.75),
    ('cornflowerblue','6495ED',100,149,237,143.98),
    ('lightsteelblue','B0C4DE',176,196,222,192.86),
    ('lightsteelblue 1','CAE1FF',202,225,255,221.4),
    ('lightsteelblue 2','BCD2EE',188,210,238,206.48),
    ('lightsteelblue 3','A2B5CD',162,181,205,177.94),
    ('lightsteelblue 4','6E7B8B',110,123,139,120.86),
    ('lightslategray','778899',119,136,153,132.77),
    ('slategray','708090',112,128,144,124.96),
    ('slategray 1','C6E2FF',198,226,255,220.79),
    ('slategray 2','B9D3EE',185,211,238,206.17),
    ('slategray 3','9FB6CD',159,182,205,177.63),
    ('slategray 4','6C7B8B',108,123,139,120.26),
    ('dodgerblue 1 (dodgerblue)','1E90FF',30,144,255,122.01),
    ('dodgerblue 2','1C86EE',28,134,238,113.64),
    ('dodgerblue 3','1874CD',24,116,205,98.19),
    ('dodgerblue 4','104E8B',16,78,139,66.11),
    ('aliceblue','F0F8FF',240,248,255,246.37),
    ('steelblue','4682B4',70,130,180,117.5),
    ('steelblue 1','63B8FF',99,184,255,166.31),
    ('steelblue 2','5CACEE',92,172,238,155.26),
    ('steelblue 3','4F94CD',79,148,205,133.57),
    ('steelblue 4','36648B',54,100,139,90.49),
    ('lightskyblue','87CEFA',135,206,250,189.54),
    ('lightskyblue 1','B0E2FF',176,226,255,214.19),
    ('lightskyblue 2','A4D3EE',164,211,238,199.87),
    ('lightskyblue 3','8DB6CD',141,182,205,172.23),
    ('lightskyblue 4','607B8B',96,123,139,116.66),
    ('skyblue 1','87CEFF',135,206,255,190.09),
    ('skyblue 2','7EC0EE',126,192,238,177.26),
    ('skyblue 3','6CA6CD',108,166,205,152.89),
    ('skyblue 4','4A708B',74,112,139,103.57),
    ('skyblue','87CEEB',135,206,235,187.89),
    ('deepskyblue 1 (deepskyblue)','00BFFF',0,191,255,140.74),
    ('deepskyblue 2','00B2EE',0,178,238,131.2),
    ('deepskyblue 3','009ACD',0,154,205,113.41),
    ('deepskyblue 4','00688B',0,104,139,76.65),
    ('peacock','33A1C9',51,161,201,132.4),
    ('lightblue','ADD8E6',173,216,230,204.64),
    ('lightblue 1','BFEFFF',191,239,255,226.36),
    ('lightblue 2','B2DFEE',178,223,238,211.15),
    ('lightblue 3','9AC0CD',154,192,205,182.03),
    ('lightblue 4','68838B',104,131,139,123.78),
    ('powderblue','B0E0E6',176,224,230,210.26),
    ('cadetblue 1','98F5FF',152,245,255,218.2),
    ('cadetblue 2','8EE5EE',142,229,238,203.89),
    ('cadetblue 3','7AC5CD',122,197,205,175.38),
    ('cadetblue 4','53868B',83,134,139,119.25),
    ('turquoise 1','00F5FF',0,245,255,172.6),
    ('turquoise 2','00E5EE',0,229,238,161.29),
    ('turquoise 3','00C5CD',0,197,205,138.78),
    ('turquoise 4','00868B',0,134,139,94.35),
    ('cadetblue','5F9EA0',95,158,160,139.32),
    ('darkturquoise','00CED1',0,206,209,144.53),
    ('azure 1 (azure)','F0FFFF',240,255,255,250.5),
    ('azure 2','E0EEEE',224,238,238,233.8),
    ('azure 3','C1CDCD',193,205,205,201.4),
    ('azure 4','838B8B',131,139,139,136.6),
    ('lightcyan 1 (lightcyan)','E0FFFF',224,255,255,245.7),
    ('lightcyan 2','D1EEEE',209,238,238,229.3),
    ('lightcyan 3','B4CDCD',180,205,205,197.5),
    ('lightcyan 4','7A8B8B',122,139,139,133.9),
    ('paleturquoise 1','BBFFFF',187,255,255,234.6),
    ('paleturquoise 2 (paleturquoise)','AEEEEE',174,238,238,218.8),
    ('paleturquoise 3','96CDCD',150,205,205,188.5),
    ('paleturquoise 4','668B8B',102,139,139,127.9),
    ('darkslategray','2F4F4F',47,79,79,69.4),
    ('darkslategray 1','97FFFF',151,255,255,223.8),
    ('darkslategray 2','8DEEEE',141,238,238,208.9),
    ('darkslategray 3','79CDCD',121,205,205,179.8),
    ('darkslategray 4','528B8B',82,139,139,121.9),
    ('cyan / aqua','00FFFF',0,255,255,178.5),
    ('cyan 2','00EEEE',0,238,238,166.6),
    ('cyan 3','00CDCD',0,205,205,143.5),
    ('cyan 4 (darkcyan)','008B8B',0,139,139,97.3),
    ('teal','008080',0,128,128,89.6),
    ('mediumturquoise','48D1CC',72,209,204,167.35),
    ('lightseagreen','20B2AA',32,178,170,133.32),
    ('manganeseblue','03A89E',3,168,158,117.4),
    ('turquoise','40E0D0',64,224,208,174.24),
    ('coldgrey','808A87',128,138,135,134.67),
    ('turquoiseblue','00C78C',0,199,140,132.81),
    ('aquamarine 1 (aquamarine)','7FFFD4',127,255,212,211.87),
    ('aquamarine 2','76EEC6',118,238,198,197.6),
    ('aquamarine 3 (mediumaquamarine)','66CDAA',102,205,170,170.25),
    ('aquamarine 4','458B74',69,139,116,115.47),
    ('mediumspringgreen','00FA9A',0,250,154,164.44),
    ('mintcream','F5FFFA',245,255,250,251.45),
    ('springgreen','00FF7F',0,255,127,164.42),
    ('springgreen 1','00EE76',0,238,118,153.4),
    ('springgreen 2','00CD66',0,205,102,132.17),
    ('springgreen 3','008B45',0,139,69,89.6),
    ('mediumseagreen','3CB371',60,179,113,136.04),
    ('seagreen 1','54FF9F',84,255,159,193.14),
    ('seagreen 2','4EEE94',78,238,148,180.1),
    ('seagreen 3','43CD80',67,205,128,155.13),
    ('seagreen 4 (seagreen)','2E8B57',46,139,87,105.38),
    ('emeraldgreen','00C957',0,201,87,128.16),
    ('mint','BDFCC9',189,252,201,227.49),
    ('cobaltgreen','3D9140',61,145,64,110.89),
    ('honeydew 1 (honeydew)','F0FFF0',240,255,240,248.85),
    ('honeydew 2','E0EEE0',224,238,224,232.26),
    ('honeydew 3','C1CDC1',193,205,193,200.08),
    ('honeydew 4','838B83',131,139,131,135.72),
    ('darkseagreen','8FBC8F',143,188,143,169.55),
    ('darkseagreen 1','C1FFC1',193,255,193,229.58),
    ('darkseagreen 2','B4EEB4',180,238,180,214.22),
    ('darkseagreen 3','9BCD9B',155,205,155,184.5),
    ('darkseagreen 4','698B69',105,139,105,125.06),
    ('palegreen','98FB98',152,251,152,210.41),
    ('palegreen 1','9AFF9A',154,255,154,213.59),
    ('palegreen 2 (lightgreen)','90EE90',144,238,144,199.46),
    ('palegreen 3','7CCD7C',124,205,124,171.79),
    ('palegreen 4','548B54',84,139,84,116.45),
    ('limegreen','32CD32',50,205,50,141.45),
    ('forestgreen','228B22',34,139,34,95.95),
    ('green 1 (lime)','00FF00',0,255,0,150.45),
    ('green 2','00EE00',0,238,0,140.42),
    ('green 3','00CD00',0,205,0,120.95),
    ('green 4','008B00',0,139,0,82.01),
    ('green','008000',0,128,0,75.52),
    ('darkgreen','006400',0,100,0,59),
    ('sapgreen','308014',48,128,20,92.12),
    ('lawngreen','7CFC00',124,252,0,185.88),
    ('chartreuse 1 (chartreuse)','7FFF00',127,255,0,188.55),
    ('chartreuse 2','76EE00',118,238,0,175.82),
    ('chartreuse 3','66CD00',102,205,0,151.55),
    ('chartreuse 4','458B00',69,139,0,102.71),
    ('greenyellow','ADFF2F',173,255,47,207.52),
    ('darkolivegreen 1','CAFF70',202,255,112,223.37),
    ('darkolivegreen 2','BCEE68',188,238,104,208.26),
    ('darkolivegreen 3','A2CD5A',162,205,90,179.45),
    ('darkolivegreen 4','6E8B3D',110,139,61,121.72),
    ('darkolivegreen','556B2F',85,107,47,93.8),
    ('olivedrab','6B8E23',107,142,35,119.73),
    ('olivedrab 1','C0FF3E',192,255,62,214.87),
    ('olivedrab 2','B3EE3A',179,238,58,200.5),
    ('olivedrab 3 (yellowgreen)','9ACD32',154,205,50,172.65),
    ('olivedrab 4','698B22',105,139,34,117.25),
    ('ivory 1 (ivory)','FFFFF0',255,255,240,253.35),
    ('ivory 2','EEEEE0',238,238,224,236.46),
    ('ivory 3','CDCDC1',205,205,193,203.68),
    ('ivory 4','8B8B83',139,139,131,138.12),
    ('beige','F5F5DC',245,245,220,242.25),
    ('lightyellow 1 (lightyellow)','FFFFE0',255,255,224,251.59),
    ('lightyellow 2','EEEED1',238,238,209,234.81),
    ('lightyellow 3','CDCDB4',205,205,180,202.25),
    ('lightyellow 4','8B8B7A',139,139,122,137.13),
    ('lightgoldenrodyellow','FAFAD2',250,250,210,245.6),
    ('yellow 1 (yellow)','FFFF00',255,255,0,226.95),
    ('yellow 2','EEEE00',238,238,0,211.82),
    ('yellow 3','CDCD00',205,205,0,182.45),
    ('yellow 4','8B8B00',139,139,0,123.71),
    ('warmgrey','808069',128,128,105,125.47),
    ('olive','808000',128,128,0,113.92),
    ('darkkhaki','BDB76B',189,183,107,176.44),
    ('khaki 1','FFF68F',255,246,143,237.37),
    ('khaki 2','EEE685',238,230,133,221.73),
    ('khaki 3','CDC673',205,198,115,190.97),
    ('khaki 4','8B864E',139,134,78,129.34),
    ('khaki','F0E68C',240,230,140,223.1),
    ('palegoldenrod','EEE8AA',238,232,170,226.98),
    ('lemonchiffon 1 (lemonchiffon)','FFFACD',255,250,205,246.55),
    ('lemonchiffon 2','EEE9BF',238,233,191,229.88),
    ('lemonchiffon 3','CDC9A5',205,201,165,198.24),
    ('lemonchiffon 4','8B8970',139,137,112,134.85),
    ('lightgoldenrod 1','FFEC8B',255,236,139,231.03),
    ('lightgoldenrod 2','EEDC82',238,220,130,215.5),
    ('lightgoldenrod 3','CDBE70',205,190,112,185.92),
    ('lightgoldenrod 4','8B814C',139,129,76,126.17),
    ('banana','E3CF57',227,207,87,199.8),
    ('gold 1 (gold)','FFD700',255,215,0,203.35),
    ('gold 2','EEC900',238,201,0,189.99),
    ('gold 3','CDAD00',205,173,0,163.57),
    ('gold 4','8B7500',139,117,0,110.73),
    ('cornsilk 1 (cornsilk)','FFF8DC',255,248,220,247.02),
    ('cornsilk 2','EEE8CD',238,232,205,230.83),
    ('cornsilk 3','CDC8B1',205,200,177,198.97),
    ('cornsilk 4','8B8878',139,136,120,135.14),
    ('goldenrod','DAA520',218,165,32,166.27),
    ('goldenrod 1','FFC125',255,193,37,194.44),
    ('goldenrod 2','EEB422',238,180,34,181.34),
    ('goldenrod 3','CD9B1D',205,155,29,156.14),
    ('goldenrod 4','8B6914',139,105,20,105.85),
    ('darkgoldenrod','B8860B',184,134,11,135.47),
    ('darkgoldenrod 1','FFB90F',255,185,15,187.3),
    ('darkgoldenrod 2','EEAD0E',238,173,14,175.01),
    ('darkgoldenrod 3','CD950C',205,149,12,150.73),
    ('darkgoldenrod 4','8B6508',139,101,8,102.17),
    ('orange 1 (orange)','FFA500',255,165,0,173.85),
    ('orange 2','EE9A00',238,154,0,162.26),
    ('orange 3','CD8500',205,133,0,139.97),
    ('orange 4','8B5A00',139,90,0,94.8),
    ('floralwhite','FFFAF0',255,250,240,250.4),
    ('oldlace','FDF5E6',253,245,230,245.75),
    ('wheat','F5DEB3',245,222,179,224.17),
    ('wheat 1','FFE7BA',255,231,186,233.25),
    ('wheat 2','EED8AE',238,216,174,217.98),
    ('wheat 3','CDBA96',205,186,150,187.74),
    ('wheat 4','8B7E66',139,126,102,127.26),
    ('moccasin','FFE4B5',255,228,181,230.93),
    ('papayawhip','FFEFD5',255,239,213,240.94),
    ('blanchedalmond','FFEBCD',255,235,205,237.7),
    ('navajowhite 1 (navajowhite)','FFDEAD',255,222,173,226.51),
    ('navajowhite 2','EECFA1',238,207,161,211.24),
    ('navajowhite 3','CDB38B',205,179,139,182.4),
    ('navajowhite 4','8B795E',139,121,94,123.43),
    ('eggshell','FCE6C9',252,230,201,233.41),
    ('tan','D2B48C',210,180,140,184.6),
    ('brick','9C661F',156,102,31,110.39),
    ('cadmiumyellow','FF9912',255,153,18,168.75),
    ('antiquewhite','FAEBD7',250,235,215,237.3),
    ('antiquewhite 1','FFEFDB',255,239,219,241.6),
    ('antiquewhite 2','EEDFCC',238,223,204,225.41),
    ('antiquewhite 3','CDC0B0',205,192,176,194.14),
    ('antiquewhite 4','8B8378',139,131,120,132.19),
    ('burlywood','DEB887',222,184,135,190.01),
    ('burlywood 1','FFD39B',255,211,155,218.04),
    ('burlywood 2','EEC591',238,197,145,203.58),
    ('burlywood 3','CDAA7D',205,170,125,175.55),
    ('burlywood 4','8B7355',139,115,85,118.9),
    ('bisque 1 (bisque)','FFE4C4',255,228,196,232.58),
    ('bisque 2','EED5B7',238,213,183,217.2),
    ('bisque 3','CDB79E',205,183,158,186.85),
    ('bisque 4','8B7D6B',139,125,107,127.22),
    ('melon','E3A869',227,168,105,178.77),
    ('carrot','ED9121',237,145,33,160.28),
    ('darkorange','FF8C00',255,140,0,159.1),
    ('darkorange 1','FF7F00',255,127,0,151.43),
    ('darkorange 2','EE7600',238,118,0,141.02),
    ('darkorange 3','CD6600',205,102,0,121.68),
    ('darkorange 4','8B4500',139,69,0,82.41),
    ('orange','FF8000',255,128,0,152.02),
    ('tan 1','FFA54F',255,165,79,182.54),
    ('tan 2','EE9A49',238,154,73,170.29),
    ('tan 3 (peru)','CD853F',205,133,63,146.9),
    ('tan 4','8B5A2B',139,90,43,99.53),
    ('linen','FAF0E6',250,240,230,241.9),
    ('peachpuff 1 (peachpuff)','FFDAB9',255,218,185,225.47),
    ('peachpuff 2','EECBAD',238,203,173,210.2),
    ('peachpuff 3','CDAF95',205,175,149,181.14),
    ('peachpuff 4','8B7765',139,119,101,123.02),
    ('seashell 1 (seashell)','FFF5EE',255,245,238,247.23),
    ('seashell 2','EEE5DE',238,229,222,230.93),
    ('seashell 3','CDC5BF',205,197,191,198.74),
    ('seashell 4','8B8682',139,134,130,135.06),
    ('sandybrown','F4A460',244,164,96,180.52),
    ('rawsienna','C76114',199,97,20,119.13),
    ('chocolate','D2691E',210,105,30,128.25),
    ('chocolate 1','FF7F24',255,127,36,155.39),
    ('chocolate 2','EE7621',238,118,33,144.65),
    ('chocolate 3','CD661D',205,102,29,124.87),
    ('chocolate 4 (saddlebrown)','8B4513',139,69,19,84.5),
    ('ivoryblack','292421',41,36,33,37.17),
    ('flesh','FF7D40',255,125,64,157.29),
    ('cadmiumorange','FF6103',255,97,3,134.06),
    ('burntsienna','8A360F',138,54,15,74.91),
    ('sienna','A0522D',160,82,45,101.33),
    ('sienna 1','FF8247',255,130,71,161.01),
    ('sienna 2','EE7942',238,121,66,150.05),
    ('sienna 3','CD6839',205,104,57,129.13),
    ('sienna 4','8B4726',139,71,38,87.77),
    ('lightsalmon 1 (lightsalmon)','FFA07A',255,160,122,184.32),
    ('lightsalmon 2','EE9572',238,149,114,171.85),
    ('lightsalmon 3','CD8162',205,129,98,148.39),
    ('lightsalmon 4','8B5742',139,87,66,100.29),
    ('coral','FF7F50',255,127,80,160.23),
    ('orangered 1 (orangered)','FF4500',255,69,0,117.21),
    ('orangered 2','EE4000',238,64,0,109.16),
    ('orangered 3','CD3700',205,55,0,93.95),
    ('orangered 4','8B2500',139,37,0,63.53),
    ('sepia','5E2612',94,38,18,52.6),
    ('darksalmon','E9967A',233,150,122,171.82),
    ('salmon 1','FF8C69',255,140,105,170.65),
    ('salmon 2','EE8262',238,130,98,158.88),
    ('salmon 3','CD7054',205,112,84,136.82),
    ('salmon 4','8B4C39',139,76,57,92.81),
    ('coral 1','FF7256',255,114,86,153.22),
    ('coral 2','EE6A50',238,106,80,142.74),
    ('coral 3','CD5B45',205,91,69,122.78),
    ('coral 4','8B3E2F',139,62,47,83.45),
    ('burntumber','8A3324',138,51,36,75.45),
    ('tomato 1 (tomato)','FF6347',255,99,71,142.72),
    ('tomato 2','EE5C42',238,92,66,132.94),
    ('tomato 3','CD4F39',205,79,57,114.38),
    ('tomato 4','8B3626',139,54,38,77.74),
    ('salmon','FA8072',250,128,114,163.06),
    ('mistyrose 1 (mistyrose)','FFE4E1',255,228,225,235.77),
    ('mistyrose 2','EED5D2',238,213,210,220.17),
    ('mistyrose 3','CDB7B5',205,183,181,189.38),
    ('mistyrose 4','8B7D7B',139,125,123,128.98),
    ('snow 1 (snow)','FFFAFA',255,250,250,251.5),
    ('snow 2','EEE9E9',238,233,233,234.5),
    ('snow 3','CDC9C9',205,201,201,202.2),
    ('snow 4','8B8989',139,137,137,137.6),
    ('rosybrown','BC8F8F',188,143,143,156.5),
    ('rosybrown 1','FFC1C1',255,193,193,211.6),
    ('rosybrown 2','EEB4B4',238,180,180,197.4),
    ('rosybrown 3','CD9B9B',205,155,155,170),
    ('rosybrown 4','8B6969',139,105,105,115.2),
    ('lightcoral','F08080',240,128,128,161.6),
    ('indianred','CD5C5C',205,92,92,125.9),
    ('indianred 1','FF6A6A',255,106,106,150.7),
    ('indianred 2','EE6363',238,99,99,140.7),
    ('indianred 4','8B3A3A',139,58,58,82.3),
    ('indianred 3','CD5555',205,85,85,121),
    ('brown','A52A2A',165,42,42,78.9),
    ('brown 1','FF4040',255,64,64,121.3),
    ('brown 2','EE3B3B',238,59,59,112.7),
    ('brown 3','CD3333',205,51,51,97.2),
    ('brown 4','8B2323',139,35,35,66.2),
    ('firebrick','B22222',178,34,34,77.2),
    ('firebrick 1','FF3030',255,48,48,110.1),
    ('firebrick 2','EE2C2C',238,44,44,102.2),
    ('firebrick 3','CD2626',205,38,38,88.1),
    ('firebrick 4','8B1A1A',139,26,26,59.9),
    ('red 1 (red)','FF0000',255,0,0,76.5),
    ('red 2','EE0000',238,0,0,71.4),
    ('red 3','CD0000',205,0,0,61.5),
    ('red 4 (darkred)','8B0000',139,0,0,41.7),
    ('maroon','800000',128,0,0,38.4),
    ('sgi beet','8E388E',142,56,142,91.26),
    ('sgi slateblue','7171C6',113,113,198,122.35),
    ('sgi lightblue','7D9EC0',125,158,192,151.84),
    ('sgi teal','388E8E',56,142,142,116.2),
    ('sgi chartreuse','71C671',113,198,113,163.15),
    ('sgi olivedrab','8E8E38',142,142,56,132.54),
    ('sgi brightgray','C5C1AA',197,193,170,191.67),
    ('sgi salmon','C67171',198,113,113,138.5),
    ('sgi darkgray','555555',85,85,85,85),
    ('sgi gray 12','1E1E1E',30,30,30,30),
    ('sgi gray 16','282828',40,40,40,40),
    ('sgi gray 32','515151',81,81,81,81),
    ('sgi gray 36','5B5B5B',91,91,91,91),
    ('sgi gray 52','848484',132,132,132,132),
    ('sgi gray 56','8E8E8E',142,142,142,142),
    ('sgi lightgray','AAAAAA',170,170,170,170),
    ('sgi gray 72','B7B7B7',183,183,183,183),
    ('sgi gray 76','C1C1C1',193,193,193,193),
    ('sgi gray 92','EAEAEA',234,234,234,234),
    ('sgi gray 96','F4F4F4',244,244,244,244),
    ('white','FFFFFF',255,255,255,255),
    ('white smoke (gray 96)','F5F5F5',245,245,245,245),
    ('gainsboro','DCDCDC',220,220,220,220),
    ('lightgrey','D3D3D3',211,211,211,211),
    ('silver','C0C0C0',192,192,192,192),
    ('darkgray','A9A9A9',169,169,169,169),
    ('gray','808080',128,128,128,128),
    ('dimgray (gray 42)','696969',105,105,105,105),
    ('black','000000',0,0,0,0),
    ('gray 99','FCFCFC',252,252,252,252),
    ('gray 98','FAFAFA',250,250,250,250),
    ('gray 97','F7F7F7',247,247,247,247),
    ('white smoke (gray 96)','F5F5F5',245,245,245,245),
    ('gray 95','F2F2F2',242,242,242,242),
    ('gray 94','F0F0F0',240,240,240,240),
    ('gray 93','EDEDED',237,237,237,237),
    ('gray 92','EBEBEB',235,235,235,235),
    ('gray 91','E8E8E8',232,232,232,232),
    ('gray 90','E5E5E5',229,229,229,229),
    ('gray 89','E3E3E3',227,227,227,227),
    ('gray 88','E0E0E0',224,224,224,224),
    ('gray 87','DEDEDE',222,222,222,222),
    ('gray 86','DBDBDB',219,219,219,219),
    ('gray 85','D9D9D9',217,217,217,217),
    ('gray 84','D6D6D6',214,214,214,214),
    ('gray 83','D4D4D4',212,212,212,212),
    ('gray 82','D1D1D1',209,209,209,209),
    ('gray 81','CFCFCF',207,207,207,207),
    ('gray 80','CCCCCC',204,204,204,204),
    ('gray 79','C9C9C9',201,201,201,201),
    ('gray 78','C7C7C7',199,199,199,199),
    ('gray 77','C4C4C4',196,196,196,196),
    ('gray 76','C2C2C2',194,194,194,194),
    ('gray 75','BFBFBF',191,191,191,191),
    ('gray 74','BDBDBD',189,189,189,189),
    ('gray 73','BABABA',186,186,186,186),
    ('gray 72','B8B8B8',184,184,184,184),
    ('gray 71','B5B5B5',181,181,181,181),
    ('gray 70','B3B3B3',179,179,179,179),
    ('gray 69','B0B0B0',176,176,176,176),
    ('gray 68','ADADAD',173,173,173,173),
    ('gray 67','ABABAB',171,171,171,171),
    ('gray 66','A8A8A8',168,168,168,168),
    ('gray 65','A6A6A6',166,166,166,166),
    ('gray 64','A3A3A3',163,163,163,163),
    ('gray 63','A1A1A1',161,161,161,161),
    ('gray 62','9E9E9E',158,158,158,158),
    ('gray 61','9C9C9C',156,156,156,156),
    ('gray 60','999999',153,153,153,153),
    ('gray 59','969696',150,150,150,150),
    ('gray 58','949494',148,148,148,148),
    ('gray 57','919191',145,145,145,145),
    ('gray 56','8F8F8F',143,143,143,143),
    ('gray 55','8C8C8C',140,140,140,140),
    ('gray 54','8A8A8A',138,138,138,138),
    ('gray 53','878787',135,135,135,135),
    ('gray 52','858585',133,133,133,133),
    ('gray 51','828282',130,130,130,130),
    ('gray 50','7F7F7F',127,127,127,127),
    ('gray 49','7D7D7D',125,125,125,125),
    ('gray 48','7A7A7A',122,122,122,122),
    ('gray 47','787878',120,120,120,120),
    ('gray 46','757575',117,117,117,117),
    ('gray 45','737373',115,115,115,115),
    ('gray 44','707070',112,112,112,112),
    ('gray 43','6E6E6E',110,110,110,110),
    ('gray 42','6B6B6B',107,107,107,107),
    ('dimgray (gray 42)','696969',105,105,105,105),
    ('gray 40','666666',102,102,102,102),
    ('gray 39','636363',99,99,99,99),
    ('gray 38','616161',97,97,97,97),
    ('gray 37','5E5E5E',94,94,94,94),
    ('gray 36','5C5C5C',92,92,92,92),
    ('gray 35','595959',89,89,89,89),
    ('gray 34','575757',87,87,87,87),
    ('gray 33','545454',84,84,84,84),
    ('gray 32','525252',82,82,82,82),
    ('gray 31','4F4F4F',79,79,79,79),
    ('gray 30','4D4D4D',77,77,77,77),
    ('gray 29','4A4A4A',74,74,74,74),
    ('gray 28','474747',71,71,71,71),
    ('gray 27','454545',69,69,69,69),
    ('gray 26','424242',66,66,66,66),
    ('gray 25','404040',64,64,64,64),
    ('gray 24','3D3D3D',61,61,61,61),
    ('gray 23','3B3B3B',59,59,59,59),
    ('gray 22','383838',56,56,56,56),
    ('gray 21','363636',54,54,54,54),
    ('gray 20','333333',51,51,51,51),
    ('gray 19','303030',48,48,48,48),
    ('gray 18','2E2E2E',46,46,46,46),
    ('gray 17','2B2B2B',43,43,43,43),
    ('gray 16','292929',41,41,41,41),
    ('gray 15','262626',38,38,38,38),
    ('gray 14','242424',36,36,36,36),
    ('gray 13','212121',33,33,33,33),
    ('gray 12','1F1F1F',31,31,31,31),
    ('gray 11','1C1C1C',28,28,28,28),
    ('gray 10','1A1A1A',26,26,26,26),
    ('gray 9','171717',23,23,23,23),
    ('gray 8','141414',20,20,20,20),
    ('gray 7','121212',18,18,18,18),
    ('gray 6','0F0F0F',15,15,15,15),
    ('gray 5','0D0D0D',13,13,13,13),
    ('gray 4','0A0A0A',10,10,10,10),
    ('gray 3','080808',8,8,8,8),
    ('gray 2','050505',5,5,5,5),
    ('gray 1','030303',3,3,3,3)
    ;    
    eos
  end

  def down
    execute 'DELETE FROM colors'
  end
  
end
