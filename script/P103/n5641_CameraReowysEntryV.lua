-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 127.925301 , 247.430649 , 30.184025 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5641);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 127.925301 , 247.430649 , 30.184025 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 127.925301 , 247.430649 , 30.184025 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 127.925301 , 247.430649 , 30.184025 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
