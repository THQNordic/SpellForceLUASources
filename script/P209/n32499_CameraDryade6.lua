-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 574.508179 , 352.826324 , 6.060410 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(576.934,356.713,6.000);]] )
   Camera:MotionSpline_AddSplinePoint( 574.508179 , 352.826324 , 6.060410 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(576.934,356.713,6.000);]] )
   Camera:MotionSpline_AddSplinePoint( 574.508179 , 352.826324 , 6.060410 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(576.934,356.713,6.000);]] )
   Camera:MotionSpline_AddSplinePoint( 574.508179 , 352.826324 , 6.060410 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(576.934,356.713,6.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
