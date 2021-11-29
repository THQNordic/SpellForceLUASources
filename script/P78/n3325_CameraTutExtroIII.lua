-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 264.732819 , 269.103210 , 17.870819 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(215.413,273.458,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 248.186462 , 268.872894 , 16.930819 , 9.199999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 238.798798 , 269.172455 , 16.880817 , 14.500019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.288055 , 271.311554 , 20.910818 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 219.828217 , 268.420898 , 26.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
