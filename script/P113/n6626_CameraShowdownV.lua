-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 202.156296 , 324.393372 , 23.962074 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(6673);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 202.058258 , 325.388550 , 23.962074 , 7.299995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.058258 , 325.388550 , 23.962074 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.058258 , 325.388550 , 23.962074 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
