for j=1:8 for k=36:j*2:117 printf("%c",k);endfor endfor
for j=1:8 for k=36:j*2:117 printf("%c",k);end end
for j=1:8 k=36;while(k<117)printf("%c",k);k+=j*2;end end
#for j=1:8 disp('$':j*2:'t');end
#for j=2:2:16 disp('$':j:'t')end
#for j=1:8 disp('$':j*2:'t')end
#for j=1:8 disp("$":j*2:'t')end
#for j=1:8disp('$':j*2:'t')end
#for j=1:8disp("$":j*2:'t');end
#for j=1:8disp("$":j*2:'t')end
disp(strcat("$":2:'t',"$":4:'t',"$":6:'t',"$":8:'t',"$":10:'t',"$":12:'t',"$":14:'t',"$":16:'t'))
z="";for j=1:8\z=strcat(z,'$':j*2:'t')end\disp(z)
z="";for j=1:8\z=strcat(z,36:j*2:117)end\disp(z)
