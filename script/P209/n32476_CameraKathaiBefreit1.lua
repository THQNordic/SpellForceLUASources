-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 523.634155 , 351.325226 , 14.106962 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.764,351.399,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 523.634155 , 351.325226 , 14.106962 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.764,351.399,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 523.634155 , 351.325226 , 14.106962 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.764,351.399,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 523.634155 , 351.325226 , 14.106962 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.764,351.399,13.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
