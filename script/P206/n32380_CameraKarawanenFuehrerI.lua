-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   --Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393227 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8788);]] )
   --Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[]] )
   --Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[]] )
   --Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(383.289,650.390,55.000);]] )
   Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393227 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.700928 , 650.848389 , 58.393230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
