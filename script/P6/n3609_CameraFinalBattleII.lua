-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 569.707886 , 398.313141 , 18.294937 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(3609);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 565.286621 , 398.057007 , 18.434652 , 16.400026 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 561.946533 , 399.680054 , 18.384932 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 559.607544 , 402.962769 , 18.724901 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
