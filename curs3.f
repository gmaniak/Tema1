      real a,b,h,sp,si,xi,s
      F(x) = Exp(x)

      a = 0
      b = 1
      n = 10
      h = (b-a)/(n+1)
      sp = 0
      si = 0
      
      do 9 i = 1,n
	p = i/2.
	pr = p - int(p)
	xi = a + i*h
	if(pr.gt.0) goto 6
	sp = sp+4*f(xi)
	goto 9
 6	si = si+2*f(xi)
 9    continue

      s = h/3. *(f(a)+si+sp+F(b))
      ERR = S-(f(1.)-f(0.))
      WRITE(*,*) s, err
      stop
      end
	

