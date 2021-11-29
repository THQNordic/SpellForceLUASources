-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 367.609985 , 260.169556 , 60.582668 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(388.809,223.721,80.000);]] )
   Camera:MotionSpline_AddSplinePoint( 374.697906 , 263.907776 , 61.657829 , 5.299997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 390.029175 , 266.932678 , 63.086903 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 409.356842 , 262.124817 , 67.982628 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
