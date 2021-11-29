-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 161.911102 , 116.129944 , 24.810984 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.522,128.800,11);]] )
   Camera:MotionSpline_AddSplinePoint( 161.911102 , 116.129944 , 24.810984 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.911102 , 116.129944 , 24.810984 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.911102 , 116.129944 , 24.810984 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 50.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
