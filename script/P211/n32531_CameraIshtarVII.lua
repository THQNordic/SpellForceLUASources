-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 362.014160 , 277.418945 , 26.488243 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(381.421,263.408,27.990);]] )
   Camera:MotionSpline_AddSplinePoint( 360.660095 , 275.180542 , 26.398243 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.283905 , 272.941833 , 26.448240 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 357.909332 , 270.692963 , 26.448244 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 11.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
