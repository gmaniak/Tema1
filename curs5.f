      program curs5
      v0 = 350.
      g = 9.81
      write(*,1)
 1    format(10x,'Difficulty level=?')
      read(*,*) L
      D = 40
      Dx = 15
      Dy = 7
      xmax = v0**2/g
      ymax = v0**2/(2*g)
      xt = xmax/2
      yt = ymax/2.5
      k = 1
 12   write(*,2) k
 2    format(5x,'the',i3,'th trail')
      write(*,*) xmax,xt
      if(xt.gt.xmax) goto 15
      if(yt.gt.ymax) goto 15      
      write(*,3)
 3    format(5x,'theta=?')
      read(*,*) t
      t = t*3.15159/180.
      yk = xt*(tan(t)-g*xt/2/(v0*cos(t))**2)
      ytp = yt+D/2
      ytm = yt-D/2
      if(yk.gt.ytp) goto 7
      if(yk.lt.ytm) goto 8
      write(*,9)
 9    format(10x,'****Congratulations!****',/,5x,
     *'****the target was destroyed****')
      goto 10
 7    write(*,4)
 4    format(5x,'the target is below the projectile')
      goto 20
 8    write(*,5)
 5    format(5x,'the target is above the projectile')
 20   if(L.eq.1) goto 11
      xt = xt+k*Dx
      if(L.lt.2) goto 11 
      yt = yt+k*Dy   
      write(*,14)
 14   format(5x,'the target is going out
     *from the protected region')
 11   k = k+1
      goto 12
 15   write(*,16)
 16   format(5x,'the target escaped from
     *the protected region')
 10   stop
      end
