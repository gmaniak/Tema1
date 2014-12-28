      program curs1
      
      real x_max, F_max
      
      write(*,'(A)') 'a=?'
      read(*,1) a
 1    format(F12.3)
      write(*,'(A)') 'b=?'
      read(*,1) b
      write(*,'(A)') 'h=?'
      read(*,1) h
      
      n = (b-a)/h
      i = 1
      F_max = 0
      
      write(*,'(x,A,10x,A,2x,10x,A,/,A,/,A)') 'i','xi','Fi',
     +'______________________________',
     +'                              '
 2    xi = a+(i-1)*h
      Fi = EXP(-(xi-1)**2)
      
      if(Fi.gt.F_max) then
		x_max = xi
		F_max = Fi
      endif
      
      write(*,3) i,xi,Fi
 3    format(I2,2(2x, F12.3))
      i = i+1
      if(i.gt.n) goto 4
      goto 2
      
 4    write(*,'(/,A,F12.3,/,A,F12.3)') 'x_max =',x_max,'F_max =',F_max
      
      stop
      end