clear all;  
disp('Trapezoidal method');
func=input('Enter the function y=f(x)=');
f=inline(func);
n=input('Enter the number of sub-intervals: n=');
x0=input('Enter the intial value of x: x0=');
xn=input('Enter the final value of x: xn=');
h=(xn-x0)/n;
x=x0:h:xn
y=zeros(1,length(x));
for i=1:n+1
    y(i)=f(x(i));
end
y
I1=0;
I2=0;
I1=y(1)+y(n+1);
for i=2:n
I2=I2+2*y(i);
end
I=0.5*h*(I1+I2);
fprintf('Thus the value of the integral is %f',I);



    
