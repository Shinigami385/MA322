function [root, val, status, data] = biSection(f, a, b, epsilon, max_iter)
	data = [];
	fa = f(a);
	fb = f(b);
    fprintf('%2s %15s %15s \n','n','x(n)','f(x(n))');
	for i = 1:max_iter
		c = (a + b) / 2;
		fc = f(c);
		err = abs(c-a);
		
		if(abs(fc) < epsilon)
			break;
		elseif (fa*fc < 0)
			b = c;
			fb = fc;
		else
			a = c;
			fa = fc;
        end
        fprintf('%2d %15f %15f \n',i,c,a,b,a+b,fc);
        
    end
end