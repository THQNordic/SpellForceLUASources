-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 290.528290 , 356.991699 , 17.989632 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(330.238,334.378,8.780);]] )
   Camera:MotionSpline_AddSplinePoint( 293.042328 , 343.303650 , 17.299631 , 13.800016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 302.948151 , 331.963867 , 17.319632 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 310.430847 , 321.855377 , 17.849632 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
