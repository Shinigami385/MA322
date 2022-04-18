function[Poly, Coeff] = ndd(X, Y, x)
	h  =  X(2)-X(1);
	mu = (x-X(1))/h;
	[m,n] = size(X);
	data1 = [];
	data2 = [];
	a = [];
	a = [a, Y(1)];
	for i  =  1:n
		data1(i) = Y(i);
	end
	for i  =  1:n-1
		t  =  i;
		for j  =  1:n-i
			data2(j) = (data1(j+1)-data1(j))/(X(t+j)-X(j));
		end
		a = [a, data2(1)];
		for j  =  1:(n-i)
			data1(j) = data2(j);
		end
	end

	Poly  =  a(1);
	for i  =  2:n
		s  =  1;
		for j  =  1:i-1
			s  =  s*(x-X(j));
		end
		Poly  =  Poly + a(i)*s;
	end

%fprintf('For year %d the population (in thousands) is %d\n',x,Poly);
Coeff  =  a(n);
for k = (n-1):-1:1
	Coeff  =  conv(Coeff,poly(X(k)));
	m  =  length(Coeff);
	Coeff(m)  =  Coeff(m) + a(k);
end