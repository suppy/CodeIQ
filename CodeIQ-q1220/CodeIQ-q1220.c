i,j;main(){for(i=0;i<25;i++){for(j=0;j<25;j++)(i==j)?printf("%c",'B'+i):printf("A");printf("\n");}}
i;main(j){for(;i<25;printf("\n"),i++)for(j=0;j<25;j++)(i==j)?printf("%c",'B'+i):printf("A");}
i;main(j){for(;i<25;printf("\n"),i++)for(j=0;j<25;j++)printf((i==j)?"%c":"A",'B'+j);}
int i=0,j;for(;i<25;printf("\n"),i++)for(j=0;j<25;j++)printf((i==j)?"%c":"A",'B'+j);
int i=0,j;for(;i++<25;printf("\n"))for(j=1;j<26;)printf((i-j++)?"A":"%c",'A'+j);
int i,j;for(;i++<25;printf("\n"))for(j=0;j++<25;)printf("%c",65+((i-j)?0:j));
int i,j;for(;i++<25;printf("\n"))for(j=0;j++<25;)printf("%c",(i-j)?65:65+j);
int i,j;for(;i++<25;puts(""))for(j=0;j++<25;)printf("%c",(i-j)?65:65+j);
int i,j;for(;i++<25;)for(j=0;j++<26;)printf("%c",26-j?i-j?65:65+j:13);
int i,j;while(i++<25)for(j=0;j++<26;)printf("%c",26-j?i-j?65:65+j:13);
int i,j;for(;i++<25;)for(j=0;j++<26;)putchar(26-j?i-j?65:65+j:13);
