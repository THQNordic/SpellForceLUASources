-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 156.066742 , 261.666931 , 31.218437 , 40.099960 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 177.099380 , 275.984894 , 31.078453 , 23.600054 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 192.057419 , 285.565125 , 31.528271 , 31.900085 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 205.243896 , 293.310852 , 31.669445 , 39.999962 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 218.147720 , 300.415741 , 31.521984 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(224.617,303.521,35.210);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
