-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 117.905525 , 462.102692 , 29.866695 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(4008);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 127.316544 , 460.681030 , 29.866692 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 142.597672 , 458.390411 , 31.746563 , 15.500023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.596313 , 442.937042 , 40.866608 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 167.312195 , 416.057404 , 47.510727 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
