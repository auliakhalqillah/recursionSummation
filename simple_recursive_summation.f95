program rec_sum
    implicit none
    integer :: n, io, i
    real, dimension(:), allocatable :: data
    real :: total_sum, summ

    open(1, file='data_recursive.txt')
    n = 0
    do 
        read(1,*,iostat=io)
        if (io /= 0) exit
        n = n + 1 
    end do
    close(1)

    allocate(data(n))

    open(2, file='data_recursive.txt')
    do i = 1,n
        read(2,*) data(i)
    end do
    close(2)

    write(*,*) 'DATA:', data
    write(*,*) 'N DATA:', n

    total_sum = summ(data,n)
    write(*,*) 'Total:', total_sum

    deallocate(data)

end program

recursive function summ(data,n) result(total)
    real,dimension(n) :: data
    real :: total

    if (n == 1) then
        total = data(n)
        return
    else
        total = data(n) + summ(data,n-1)
        return
    end if
end function summ