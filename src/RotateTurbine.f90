subroutine RotateTurbine

    use configr
    use element
    use blade
    use strut
	use tipvars
	
	integer :: nedge 		! Number of edges per blade
	integer :: i_top 		! Index of the primary blade top tip (tip rotor rotation axis)
	integer :: i_bot		! Index of the primary blade bottom tip (tip rotor rotation axis)
	integer :: itt			! Index of top tip rotor blades
	integer :: itb			! Index of bottom tip rotor blades
	
	nedge = nbe+1

    ! Updates current turbine geometry

    ! Rotate turbine axis of rotation and origin if necessary...

    ! Rotate blades
    do i=1,nb
        Call RotateBlade(i,delt,RotX,RotY,RotZ,RotPX,RotPY,RotPZ)
    end do
	
	! Rototate tip rotors
	if (tiprotorflag > 0) then
        write(*,*) 'Tip rotor ON'
		nbprimary=nb-ntip*nbtip
		do k=1, nbprimary
			do i=1, nbtip ! Loop through tip blades per primary rotor blade
				itt=nbprimary + i + (k - 1) * nbtip * nbprimary
				itb=nbprimary + i + nbtip + (k - 1) * nbtip * nbprimary
				i_top = k*nedge
				i_bot = nedge*(k-1) + 1
				! Top tip rotor
				Call RotateBlade(itt,tipdelt,txBE(i_top),tyBE(i_top),tzBE(i_top),xBE(i_top),yBE(i_top),zBE(i_top))
				! Bottom tip rotor
				Call RotateBlade(itb,tipdelt,txBE(i_bot),tyBE(i_bot),tzBE(i_bot),xBE(i_bot),yBE(i_bot),zBE(i_bot))
				
			end do
		end do	
    end if

    ! Rotate struts
    do i=1,NStrut
        Call RotateStrut(i,delt,RotX,RotY,RotZ,RotPX,RotPY,RotPZ)
    end do

    return
end subroutine RotateTurbine
