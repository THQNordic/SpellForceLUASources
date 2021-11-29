-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 76.371857 , 118.094139 , 36.023598 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6817);
Camera:ScriptSplineAddTargetLookAtOffset(0,1,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 77.294411 , 119.067436 , 35.823612 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 78.227150 , 121.038826 , 35.823597 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 79.134338 , 123.012184 , 35.773602 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
