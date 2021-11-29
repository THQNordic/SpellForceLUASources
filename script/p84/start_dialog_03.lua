-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 275.694580 , 214.237320 , 14.246195 , 14.800020 , [[Camera:ScriptSplineLookAtPosition(274.260,212.682,14.500);]] )
   Camera:MotionSpline_AddSplinePoint( 275.694580 , 214.237320 , 14.246195 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 275.694580 , 214.237320 , 14.246195 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 275.694580 , 214.237320 , 14.246195 , 14.800020 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
