-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 310.973663 , 422.308777 , 58.813396 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.701782 , 430.668396 , 56.983223 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 340.644073 , 425.238434 , 68.528229 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.648163 , 411.246002 , 63.143280 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 100.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
