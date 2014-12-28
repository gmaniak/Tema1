      program curs10
      dimension a(10,10), b(10,10), c(10,10)
      n = 3
      open(1,file='mat.dat',status='old')
      read(1,*) ((a(i,j),j=1,n),i=1,n)
      read(1,*) ((b(i,j),j=1,n),i=1,n)
   2  format(3(f12.4,2x))
      write(*,3)
   3  format(10x,'matrix a')
      write(*,2) ((a(i,j),j=1,n),i=1,n)
      write(*,4) 
   4  format(10x,'matrix b')
      write(*,2) ((b(i,j),j=1,n),i=1,n)
      close(1)
      do 6 k=1,n
        do 6 i=1,n
          do 5 j=1,n
   5        s = s+a(k,j)*b(j,i)
          c(k,i) = s
          s = 0
   6  continue
      write(*,'(10x,"matrix c")')
      write(*,2) ((c(i,j),j=1,n),i=1,n)
      stop
      end
      
