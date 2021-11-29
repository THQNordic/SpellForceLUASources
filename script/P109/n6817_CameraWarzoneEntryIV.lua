-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 332.100372 , 652.744507 , 26.465725 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(341.455,652.325,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 326.750946 , 651.612366 , 26.442863 , 3.599999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 320.228363 , 650.231995 , 26.442863 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 299.412628 , 645.826965 , 27.121426 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
