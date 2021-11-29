-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 376.089539 , 450.512512 , 77.333130 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(2850);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 376.089539 , 450.512512 , 77.333130 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.089539 , 450.512512 , 77.333130 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.089539 , 450.512512 , 77.333130 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
