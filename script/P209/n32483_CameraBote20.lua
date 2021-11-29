-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 304.870789 , 445.630280 , 13.945541 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(295.866,443.899,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 304.870789 , 445.630280 , 13.945541 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(295.866,443.899,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 304.870789 , 445.630280 , 13.945541 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(295.866,443.899,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 304.870789 , 445.630280 , 13.945541 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(295.866,443.899,16.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
