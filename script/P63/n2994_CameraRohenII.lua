-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 171.935867 , 329.086151 , 36.596691 , 31.000082 , [[Camera:ScriptSplineLookAtNpc(2994);]] )
   Camera:MotionSpline_AddSplinePoint( 171.935867 , 329.086151 , 36.916496 , 19.600039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 171.935867 , 329.086151 , 37.409615 , 30.900082 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 171.935867 , 329.086151 , 37.972672 , 0.000000 ,  [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 32.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
