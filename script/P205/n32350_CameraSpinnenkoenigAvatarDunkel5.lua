-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 188.474609 , 433.604736 , 50.717106 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 188.474609 , 433.604736 , 50.717106 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 188.474609 , 433.604736 , 50.717106 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 188.474609 , 433.604736 , 50.717106 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
