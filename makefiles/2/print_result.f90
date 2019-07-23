subroutine print_result(result) bind(C, name="print_result")

  implicit none

  double precision, intent(in) :: result

  print *, result

end subroutine print_result
