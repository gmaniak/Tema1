      write(*,1)
   1  format(1x,'initial speed=0',3x,'ALTITUDE>1500m =?')
      read(*,*) v0,hl
      g = 9.81
      wsc = 200
      u = 1700
      dt = 0.1
      pmax = 109
      w0 = 2000
      vlim = -2.5
      ep = 0
      t = 0
      tr = 0
      vl = v0
      w = w0
      pm = 0
   7  a = -g+(u-vl)*pm/(w+wsc)/dt
      if(w.eq.0) a = -g
      vp = vl+a*dt
      hp = hl+vl*dt+(a+dt**2)/2
      if(tr.gt.5) goto 2
      goto 3
   2  tr = 0
      wp = vp*3.6
      write(*,4) t,hp,wp,w  !,pm
   4  format(1x,'Time=',f7.2,3x,'Altitudine=',f12.2,3x,
     *'velocity=',f9.2,3x,'fuel=',f7.2) !'pm=',f7.2)
      write(*,5)
   5  format(10x,'engine power %')
      read(*,*) ep
   3  vl = vp
      hl = hp
      pm = pmax*ep/100.*dt
      tr = tr+dt
      t = t+dt
      w = w-pm
      if(w.lt.0)  w = 0
      if(hp.gt.0) goto 7
      if(hp.lt.0) hp = 0
      write(*,*) t,hp,vp
      if(vp.lt.vlim) goto 10
      write(*,9)
   9  format(10x,'Successfully landed')
      goto 11
  10  write(*,8) 
   8  format(10x,'The spacecraft crashed')
  11  stop
      end
      
