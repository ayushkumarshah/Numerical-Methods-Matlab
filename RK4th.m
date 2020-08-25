clear all;  
disp('4th order Runge Kutta method');
func=input('Enter the function (dy/dx)=f(x,y)= ');
f=inline(func);
h=input('Enter the value of h: h=');
x0=input('Enter the intial value of x: x0=');
xn=input('Enter the final value of x: xn=');
y0=input('Enter the intial value of y: y0=');

x=x0:h:xn;
n=length(x)-1;
y=zeros(1,length(x));
y(1)=y0;
fprintf('n        x(n)        y(n)        k1             k2             k3        k4         y(n+1)\n');
for i=1:n
    k1=h*f(x(i),y(i));
    k2=h*f(x(i)+0.5*h,y(i)+0.5*k1);
    k3=h*f(x(i)+0.5*h,y(i)+0.5*k2);
    k4=h*f(x(i)+h,y(i)+k3);
    y(i+1)=y(i)+((1/6)*(k1+2*k2+2*k3+k4));
    fprintf('%d     %f     %f     %f     %f     %f     %f     %f\n',i,x(i),y(i),k1,k2,k3,k4,y(i+1));
    
end

for i=1:n+1
    fprintf('y(%.2f)=y%d=%.4f\n',x(i),i-1,y(i));
end

