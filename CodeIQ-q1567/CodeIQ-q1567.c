main(i,j,f){
char b[12]={0},p[3],q[62]="2";
for(i=3;i<114;i+=2){
f=1;
for(j=3;j<i;j++)if(i%j==0){f=0;break;}
if(f){sprintf(p,"%d",i);strcat(q,p);}
}
for(i=0;i<61;i++){
strcpy(b,"brainfuck");
b[q[i]-48]=42;
printf("%s",b);
}
}
