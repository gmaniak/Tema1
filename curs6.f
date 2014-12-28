      f(x) = exp(-((x-1)/1.5)**2)

      dimension da(100), db(100)
      
      write(*,1)
   1  format('a=?')
      read(*,*) a
      write(*,2) 
   2  format('b=?')
      read(*,*) b
      n = 100
      write(*,3)
   3  format('The derivative order=?')
      read(*,*) l
      
      h = (b-a)/n
      do 9 j=1,n     
       xj = a+(j-1)*h
   9   da(j) = f(xj)
      open(1,file='derv.dat',status = 'unknown')
      write(1,7)
   7  format(14x,'xj',14x,'F(xj)',14x,'Db')
c      write(1,10)
c   10 format(14x,'Derivative order',i3)
     
       do 12 k=1,l
        write(1,10) k
   10   format(20x'Derivative order',i3)
        xi = a
        do 5 i=2,n
          db(i) = da(i)-da(i-1)/h
          write(1,8) xi,F(xi),db(i)
   8      format(3(8x,f9.4))
   5      xi = xi+h
        do 11 j=1,n
   11     da(j) = db(j)
   12   continue
      close(1)
      stop
      end

