-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 381.765106 , 438.720612 , 58.051403 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8793);]] )
   Camera:MotionSpline_AddSplinePoint( 381.676208 , 435.721893 , 59.051403 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.616943 , 433.722748 , 60.051403 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.557678 , 431.723602 , 58.051403 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.522583 , 430.724213 , 56.051403 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.463593 , 425.528564 , 56.149349 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
