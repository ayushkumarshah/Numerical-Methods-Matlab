clear all;  
disp('Finite Difference method');
fprintf('Consider BVP y"+f(x)y`(x)+g(x)y(x)=r(x), a<=x<=b, y(a)=alpha, y(b)=beta\n');
f=inline(input('Enter value of f(x):f(x)='));
g=inline(input('Enter value of g(x):g(x)='));
r=inline(input('Enter value of r(x):r(x)='));
h=input('Enter the value of h: h=');
x0=input('Enter the intial value of x: x0=');
xn=input('Enter the final value of x: xn=');
y0=input('Enter the intial value of y: y0=');
yn=input('Enter the final value of y: yn=');
x=x0:h:xn;
n=length(x)-1;
y=zeros(1,length(x));
y(1)=y0;
y(length(x))=yn;
fprintf('The FD scheme is (2-fi h)y(i-1)+(2gi h^2-4)yi+(2+fi h)y(i+1)=2h^2 ri\n');
fprintf('This scheme consists %d system of linear equations with %d unknowns y1,y2,...\n',n-1,n-1);
fprintf('The system in matrix form is\n');
d=zeros(1,n-1);
d1=zeros(1,n-2);
d2=zeros(1,n-2);
for i=1:n-1
    d(i)=2*g(x(i))*h^2-4;
end
for i=1:n-2
    d1(i)=2+f(x(i))*h;
    d2(i)=2-f(x(i+1))*h;
end
A=diag(d)+diag(d1,1)+diag(d2,-1)
X=zeros(n-1,1);
B=zeros(n-1,1);
B(1)=(2*h^2*r(x(1)))-((2-f(x(1))*h)*y0);
B(n-1)=(2*h^2*r(x(1)))+((2+f(x(n-1))*h)*yn);
for i=2:n-2
    B(i)=2*h^2*r(x(i));
end
B
X=inv(A)*B
for i=2:n
    y(i)=X(i-1);
    fprintf('y(%.3f)=y%d=%.4f\n',x(i),i-1,y(i));
end

