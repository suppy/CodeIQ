int i=2,j,p;for(;i<999;i++){for(j=p=2;j<i;)if(i%j++==0)p=0;if(p)printf((i!=997)?"%d:":"%d",i);}