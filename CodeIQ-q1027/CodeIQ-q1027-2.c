main(i,j,p){for(i=2;i<997;i++){for(j=p=2;j<i;)if(i%j++==0)p=0;if(p)printf("%d:",i);}printf("997");}
int i=2,j,p;for(;i<997;i++){for(j=p=2;j<i;)if(i%j++==0)p=0;if(p)printf("%d:",i);}printf("997");
int i=2,j,p;for(;i<999;i++){for(j=p=2;j<i;)if(i%j++==0)p=0;if(p)printf((i!=997)?"%d:":"%d",i);}
int i=2,j,p;for(;i<999;i++){for(j=p=2;j<i;)if(i%j++==0)p=0;p?printf((i!=997)?"%d:":"%d",i):0;}
int i=2,j,p;for(;i<999;i++){for(j=p=2;j<i;)i%j++==0?p=0:0;p?printf((i!=997)?"%d:":"%d",i):0;}
int i=2,j,p;for(;i<999;i++){for(j=p=2;j<i;)i%j++==0?p=0:0;p?printf(i!=997?"%d:":"%d",i):0;}
int i=2,j,p;for(;i<997;i++){for(j=p=2;j<i;)i%j++==0?p=0:0;p?printf("%d:",i):0;}printf("997");
