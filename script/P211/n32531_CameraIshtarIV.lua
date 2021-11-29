-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 360.819855 , 282.566498 , 29.033428 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 362.338074 , 280.131836 , 29.053427 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 364.697296 , 277.806763 , 28.893734 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
   Camera:MotionSpline_AddSplinePoint( 366.944153 , 275.592407 , 28.924015 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10100);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
