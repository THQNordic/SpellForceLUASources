-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.532440 , 304.123352 , 62.041557 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(341.850,318.521,55.000);]] )
   Camera:MotionSpline_AddSplinePoint( 339.301727 , 302.750702 , 61.911560 , 8.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 345.236572 , 302.533539 , 60.931606 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 352.924194 , 303.578857 , 58.901798 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
