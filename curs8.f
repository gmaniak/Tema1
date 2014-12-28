      dimension x(50),y(50),yt(50)
      open(1,file='experiment.dat',status='old')
      read(1,*) n
      do 11 k=1,n
        read(1,*) x(k),y(k)
 11     write(*,*) x(k),y(k)
      close(1)
      call smm(x,n,sx)
      call smm(y,n,sy)
      call smpp(x,y,n,sxy)
      call smpp(x,x,n,sxx)
      snum = sx**2-n*sxx
      a = (sx*sy-n*sxy)/snum
      b = (sx*sxy-sxx*sy)/snum
      write(*,4) a,b
 4    format(x,'Parameters of y = A*x+B',/,'a = ',
     *f12.6,3x,'b = ',f12.6)
      do 7 i=1,n
 7      yt(i) = a*x(i)+b
      s = 0
      do 8 i=1,n
 8      s = s+(y(i)-yt(i))**2
      s = sqrt(s)/n
      write(*,10) s
 10   format(10x,'***err = ',e12.6,'***')
      stop
      end

      subroutine smpp(a,b,n,sab)
      dimension a(n),b(n)
      sab = 0
      do 30 i=1,n
 30     sab = sab+a(i)*b(i)
      return
      end

      subroutine smm(a,n,sa)
      dimension a(n)
      sa = 0
      do 20 k=1,n
 20     sa = sa+a(k)
      return
      end
