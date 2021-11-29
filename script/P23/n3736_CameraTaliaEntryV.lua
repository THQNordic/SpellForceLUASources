-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 610.127869 , 284.598480 , 31.405296 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3737);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.5);]] )
   Camera:MotionSpline_AddSplinePoint( 609.214172 , 279.844452 , 31.275345 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.445801 , 273.501953 , 31.225494 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 615.021667 , 268.894287 , 32.145348 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
