(function() {
    // 計測
    var check = function(fnc) {
        if (typeof fnc === "function") {
            var tmStart = + new Date();
            for (var i = 0; i < 100000; i ++) {
                var res = fnc(i);
            }
            var tmEnd = + new Date();
            return tmEnd - tmStart;
        }
        return "Error";
    };

    // 処理1
    var fnc1 = function(i) {
        return "あ" + "い" + i + "え" + "お";
    };

    // 処理2
    var fnc2 = function(i) {
        return ["あ", "い", i, "え", "お"].join("");
    };

    // 計測実行
    var resArr = [];
    resArr.push("処理1 : " + check(fnc1) + " msec");
    resArr.push("処理2 : " + check(fnc2) + " msec");
    return resArr.join("\n");
})()
