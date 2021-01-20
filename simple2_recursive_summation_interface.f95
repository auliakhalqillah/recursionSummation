! Interface usage source
! https://web.stanford.edu/class/me200c/tutorial_90/08_subprograms.html
program rec_sum
    implicit none

    interface
        function summ(dat) result(total)
            real, dimension(:), allocatable :: dat
            real :: total
            integer :: n
        end function
    end interface

    integer :: n, io, i
    real, dimension(:), allocatable :: dat
    real :: total_sum
    real :: start_time, finish_time
    character(len=100) :: fmt

    call cpu_time(start_time)
    write(*,*) 'Recursive Summation Function Using Interface'
    write(*,*)
    open(1, file='data_recursive.txt')
    n = 0
    do 
        read(1,*,iostat=io)
        if (io /= 0) exit
        n = n + 1 
    end do
    close(1)

    write(*,*) 'N data:', n

    allocate(dat(n))
    open(2,file='data_recursive.txt')
    do i = 1,n 
        read(2,*) dat(i)
    end do
    close(2)

    write(*,*) 'Data:'
    do i = 1,n 
        write(*,*) dat(i)
    end do

    total_sum = summ(dat)
    write(*,*) 'Total:', total_sum

    deallocate(dat)

    call cpu_time(finish_time)
    fmt = '(a, f10.7, a)'
    write(*,fmt) 'Time Processing:', finish_time - start_time, ' seconds'

end program

recursive function summ(dat) result(total)
    real,dimension(:), allocatable :: dat
    real :: total
    integer :: n

    n = int(size(dat))

    if (n == 1) then
        total = dat(n)
        return
    else
        dat = dat(1:n-1)
        total = dat(n) + summ(dat)
        return
    end if

end function summ