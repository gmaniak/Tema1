      program curs4

      F(x) = exp(-((x-1)/1.5)**2)

      open(2,file='date.in',status='old')
      read(2,*) a
      read(2,*) b

c      write(*,'("a=?")')
c      read(*,*) a
c      write(*,'("b=?")')
c      read(*,*) b

      write(*,3)
  3   format('1 for the derivative of the first order',/,
     *'2 for the dwerivative of the second order')
      read(*,*) nd
      h = (b-a)/100
      open(1,file='derv.dat',status='unknown')
      write(1,7)
  7   format(8x,'xi',8x,'F(xi)',8x,'Di')
      do 5 i=1,100
	xi = a+(i-1)*h
	xip1 = xi+h
	xim1 = xi-h
	ff = f(xi)
	if(nd.eq.2) goto 4
	di = (f(xip1)-f(xi))/h
	goto 5
   4    di = (f(xip1)-2*f(xi)+f(xim1))/h/h
   5  write(1,8) xi,ff,di
   8  format(x,3(f9.4,4x))
      close(1)
      stop
      end