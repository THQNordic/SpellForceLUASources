-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 127.074478 , 291.664246 , 43.476402 , 50.099808 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 127.074478 , 291.664246 , 43.476402 , 50.099808 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 127.074478 , 291.664246 , 43.476402 , 50.099808 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
   Camera:MotionSpline_AddSplinePoint( 127.074478 , 291.664246 , 43.476402 , 50.099808 , [[Camera:ScriptSplineLookAtNpc(5210);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
