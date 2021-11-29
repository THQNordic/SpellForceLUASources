-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 362.010529 , 313.587433 , 17.497921 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(348.542,330.552,10.880);]] )
   Camera:MotionSpline_AddSplinePoint( 363.666809 , 315.224701 , 17.497921 , 3.099999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 366.354034 , 317.827209 , 17.698055 , 5.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 369.973572 , 321.458954 , 17.497923 , 8.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 374.265839 , 325.701904 , 17.497921 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.689331 , 327.109039 , 17.497921 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
