module tipvars

    ! Parameters defining the secondary (tip) rotor

    integer :: tiprotorflag           ! Flag for tip rotors
    real :: rpmtip    				  ! RPM of tip rotor
    real :: tsrtip        			  ! Tip-speed ratio tip rotor
	integer :: ntip					  ! Number of tip rotors
	integer :: nbtip				  ! Number of tip rotor blades (per tip rotor)
	integer :: nbprimary 			  ! Number of primary rotors

end module tipvars
