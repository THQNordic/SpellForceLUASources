-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 79.409775 , 521.341858 , 49.656395 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(93.652,564.888,28.710);]] )
   Camera:MotionSpline_AddSplinePoint( 79.409775 , 521.341858 , 49.656403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(93.652,564.888,28.710);]] )
   Camera:MotionSpline_AddSplinePoint( 79.409775 , 521.341858 , 49.656403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(93.652,564.888,28.710);]] )
   Camera:MotionSpline_AddSplinePoint( 79.409775 , 521.341858 , 49.656403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(77.786,580.790,24.977);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
