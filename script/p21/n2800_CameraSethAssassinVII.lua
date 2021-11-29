-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 106.167435 , 456.925201 , 37.595142 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(96.115,452.046,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 104.101006 , 457.340240 , 37.595142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 102.029282 , 457.763245 , 37.595142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 99.952248 , 458.182739 , 37.595142 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
