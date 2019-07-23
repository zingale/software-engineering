subroutine compute(x, y, z) bind(C, name="compute")

  implicit none

  double precision, intent(in) :: x, y
  double precision, intent(out) :: z

  z = x + y

  return
end subroutine compute
