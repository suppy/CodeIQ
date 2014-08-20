for i:=1;i<51;i++{if i%15<1{fmt.Printf("FIZZBUZZ")}else if i%3<1{fmt.Printf("fizz")}else if i%5<1{fmt.Printf("fizz")}else{fmt.Printf("%d",i)}}
s:="";for i:=1;i<51;i++{if i%15<1{s+="FIZZBUZZ"}else if i%3<1{s+="fizz"}else if i%5<1{s+="fizz"}else{s+=strconv.Itoa(i)}}fmt.Printf("%s",s)
for i:=1;i<51;i++{if i%15<1{fmt.Printf("FIZZBUZZ")}else if i%3<1{fmt.Printf("fizz")}else if i%5<1{fmt.Printf("buzz")}else{fmt.Printf("%d",i)}}
