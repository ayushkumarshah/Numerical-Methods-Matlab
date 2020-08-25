f=inline('x^3+4*x^2-10');
fd=inline('3*x^2+8*x');
tol=1e-4;
a=1;
b=2;

c=(a+b)/2;
val=c;
fprintf('a     b     c     f(c)     Error\n');
while val>tol
    fprintf('%f     %f     %f     %f     %f\n',a,b,c,f(c),val);
    cold=c;
    if f(a)*f(c)<0
        b=c;
    else 
        a=c;
    end
    
    c=(a+b)/2;
    val=abs(cold-c);
end
fprintf('root is %f',c);
