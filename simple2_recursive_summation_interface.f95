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

    do i = 1,n 
        write(*,*) dat(i)
    end do

    total_sum = summ(dat)
    write(*,*) 'Total:', total_sum

    deallocate(dat)
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