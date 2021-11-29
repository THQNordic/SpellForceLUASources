-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 170.645920 , 445.677612 , 22.108229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 177.669525 , 447.053070 , 21.248018 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 180.194183 , 451.862244 , 22.248013 , 0.000000 , [[Camera:ScriptSplineLookAtNpc();]] )
   Camera:MotionSpline_AddSplinePoint( 179.260483 , 456.427490 , 22.248013 , 0.000000 , [[Camera:ScriptSplineLookAtNpc();]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
