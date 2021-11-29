-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 316.611328 , 386.076172 , 16.342346 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 316.283478 , 386.264191 , 16.342346 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 315.992645 , 386.508148 , 16.342346 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 315.739319 , 386.788300 , 16.342346 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
