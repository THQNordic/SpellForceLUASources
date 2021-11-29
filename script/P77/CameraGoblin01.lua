-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 203.991043 , 181.426346 , 11.782602 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(5195);
Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 217.868271 , 183.058182 , 11.782602 , 11.100006 , [[Camera:ScriptSplineLookAtNpc(5195);
Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 237.255005 , 183.200531 , 8.722607 , 16.000025 , [[Camera:ScriptSplineLookAtNpc(5195);
]] )
   Camera:MotionSpline_AddSplinePoint( 251.283798 , 184.242401 , 7.146111 , 19.800039 , [[Camera:ScriptSplineLookAtNpc(5195);
]] )
   Camera:MotionSpline_AddSplinePoint( 261.970154 , 182.384323 , 6.782602 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);
]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 55.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
