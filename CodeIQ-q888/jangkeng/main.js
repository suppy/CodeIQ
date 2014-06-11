"use strict";

/// run all matches
function run_all()
{
    /// calculate scores from pair of hand strings.
    function calc_scores( hands )
    {
        if ( 0 <= hands[0].indexOf("invalid") ) {
            return [ - Infinity, 0];
        } else if ( 0 <= hands[1].indexOf("invalid") ) {
            return [0, - Infinity];
        }
        var r = [0, 0];
        var score_table = {
            GC: 17,
            CP: 10,
            PG: 10 
        };
        for ( var i = 0 ; i < hands[0].length ; ++i ) {
            r[0] += score_table[ hands[0][i] + hands[1][i] ] || 0;
            r[1] += score_table[ hands[1][i] + hands[0][i] ] || 0;
        }
        return r;
    }

    function sign(x) {
        return (0 < x) - (x < 0);
    }

    function add_point( ix, r )
    {
        var $point = $("#point_" + ix);
        var cur = parseInt( $point.text(), 10 );
        $point.text( cur + [ 0, 10001, 30010 ][r + 1] );
    }

    function split_10(s)
    {
        var r = "";
        for ( var i = 0 ; i < 10 ; ++i ) {
            if ( i ) {
                r += " ";
            }
            r += s.substr(i * 10, 10);
        }
        return r;
    }

    function log_info( args, scores, hands )
    {
        return [
        args[0].fn + " : " + scores[0] + " /  " + args[1].fn + " : " + scores[1],
        split_10(hands[0]),
        split_10(hands[1])
        ].join("<br/>");
    }

    function update_table( a, b, diff )
    {
        var $td = $("td#cell" + a + "_" + b);
        $td.text( "L-W"[diff + 1] );
        $td.addClass( ["lose", "even", "win"][diff + 1] );
        add_point( a, diff );
    }

    function show_result( args, hands, tick )
    {
        var scores = calc_scores( hands );
        $("#log").append( "<hr noshade>" );
        $("#log").append( log_info(args, scores, hands ) );

        var diff = sign(scores[0] - scores[1]);
        update_table( args[0].ix, args[1].ix, diff );
        update_table( args[1].ix, args[0].ix, - diff );
    }
    function play( args ) {
        var t0 = ( new Date() ).getTime();
        function curTick() {
            return ( new Date() ).getTime() - t0;
        }
        var players = [
        new Worker("players/" + args[0].fn),
        new Worker("players/" + args[1].fn )
        ];
        var hands = ["", ""];
        function nextHands() {
            for ( var i = 0 ; i < 2 ; ++i ) {
                players[i].postMessage(hands[i] + "," + hands[1 - i]);
            }
        }
        function addEventListener(i, p) {
            p.addEventListener('message', function(e) {
                var valid = {
                    G: 1,
                    C: 1,
                    P: 1
                }
                [e.data];
                hands[i] += valid ? e.data : ("[[invalid hand : " + e.data + "]]" );
                if ( hands[0].length == hands[1].length || ! valid) {
                    if ( hands[1].length < 100 && valid) {
                        nextHands();
                    } else {
                        show_result( args, hands, curTick() );
                        players[0].terminate();
                        players[1].terminate();
                        return;
                    }
                }
            }, false);
        }
        for ( var i = 0 ; i < 2 ; ++i ) {
            addEventListener(i, players[i]);
        }
        nextHands();
    }
    function append_head(srces)
    {
        var head = "";
        for ( var b = 0 ; b < srces.length ; ++b ) {
            head += "<th>" + (b + 1) + "</th>";
            if ( b%5 == 4 ) {
                head += "<td class='gap'></td>";
            }
        }
        $("table").append("<tr class='head'><th>#</th><th>name</th><th>point</th>" + head + "</tr>");
    }
    function build_table(srces)
    {
        append_head(srces);
        for ( var a = 0 ; a < srces.length ; ++a ) {
            var s = "";
            for ( var b = 0 ; b < srces.length ; ++b ) {
                s += "<td id='cell" + a + "_" + b + "'>&nbsp;</td>";
                if ( b%5 == 4 ) {
                    s += "<td class='gap'></td>";
                }
            }
            if ( a%10 === 5 ) {
                $("table").append("<tr class='gap'><td/></tr>");
            } else if ( a%10 === 0 && a ) {
                append_head(srces);
            }
            var name = srces[a].substring( 0, srces[a].length-3 );
            $("table").append("<tr><td>" + (a + 1) + "</td><th>" + name + "</th><td class='point' id='point_" + a + "'>0</td>" + s + "</tr>");
        }
        append_head(srces);
    }

    $("p#log").empty();
    $("table").empty();
    var srces = [
    "Amazing Opossum.js",
    "Careless Rabbit.js",
    "Fashionable  Crocodile.js",
    "King Pangolin.js",
    "Monday Sparrow.js",
    "Stone Believer.js",
    "Ultimate Stone Slayer.js",
    "Your Code.js"
    ];
    build_table(srces);
    var plays = [];
    function startPlay(a, b) {
        play( [ {
            ix: a,
            fn: srces[a] 
        }, {
            ix: b,
            fn: srces[b] 
        }
        ] );
    }
    for ( var a = 0 ; a < srces.length ; ++a ) {
        for ( var b = 0 ; b < a ; ++b ) {
            startPlay(a, b);
        }
    }
}

