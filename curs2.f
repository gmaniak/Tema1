      program curs2

      write(*,'("a = ?")')
      read(*,*) a
      write(*,'("b = ?")')
      read(*,*) b
      write(*,'("n = ?")')
      read(*,*) n
       
      if(b.lt.a) then
	write(*,'("input error: b<a")')
	stop
      endif
       
      h = (b-a)/n
      i = 1
      s = 0
      sigma = 2
       
      do 1 i=1,n
        xi = a+(i-1)*h
	xi_p = a+i*h
	xm = (xi+xi_p)/2
        Fi = exp(-(xm**2)/sigma)
 1      s = s+Fi*h
	
	DFi = (-2*xm/sigma)*exp(-(xm**2)/sigma)
	D = DFi/h
	
c	 DEBUG
c        write(*,'(3(f12.3,2x))') xi,fi,s
       
      err = s-(exp(b)-exp(a))
      write(*,2) s, err
 2    format('integral =',2x,e12.6,/,'error =', 2x,e12.6)
      stop
      end