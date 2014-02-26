// CodeIQ運営事務局  アプリケーションエンジニアを募集する企業さんからのウチに来ない？の問題
// JS：海平の怒りを最小限にせよ


// 教科データ
var category=['Ja','Ma','En','So','Sc','Mu','Ar'];
// 海平怒りのスコア初期値
var score=[35,15,20,30,25,15,25];
// 海平怒りの倍数（7日分
var multiplier=[
        [1,1,2,3,5,8,13],
        [1,5,9,13,17,21,25],
        [1,5,8,12,15,19,22],
        [1,3,5,7,9,11,13],
        [1,2,4,6,8,10,12],
        [1,4,6,9,11,14,16],
        [1,2,2,3,5,8,11],
];

print(category[0]);
print(multiplier[0][3]);

function minimumSeries(days) {
	if(days > 7){
		return 0;
	}
	print(days);
	for(var i = 0;i < 7;i++){
		minimumSeries(days+1);
		
	}
}

print(category.length);

var totalScore = 0;
var show=[false, false, false, false, false, false, false];

for(var i = 0;i < category.length;i++){
	while(show[(j = Math.floor(Math.random () * category.length))] === true);
	totalScore += score[j] * multiplier[i][j];
	show[j] = true;
	print(category[j]);
}
print(totalScore);
