-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 482.408997 , 113.268890 , 28.591694 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(501.789,154.243,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 490.486115 , 110.857086 , 26.826378 , 5.399997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 502.600403 , 107.266022 , 25.088171 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 519.863342 , 106.472282 , 24.091908 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
