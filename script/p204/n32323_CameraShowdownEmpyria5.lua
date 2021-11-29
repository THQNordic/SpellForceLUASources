-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 459.698425 , 208.294235 , 40.761536 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 459.698425 , 208.294235 , 40.761536 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 459.698425 , 208.294235 , 40.761536 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 459.698425 , 208.294235 , 40.761536 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
