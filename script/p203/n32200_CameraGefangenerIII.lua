-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 565.832153 , 308.954559 , 30.216480 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 556.832153 , 304.954529 , 30.216499 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 544.832153 , 298.954529 , 30.216499 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 532.832153 , 293.954529 , 30.216499 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
