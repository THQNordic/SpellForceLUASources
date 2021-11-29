-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 411.408630 , 362.184082 , 21.147415 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(380.026,378.730,13.270);]] )
   Camera:MotionSpline_AddSplinePoint( 411.408630 , 362.184082 , 21.147415 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(380.026,378.730,13.270);]] )
   Camera:MotionSpline_AddSplinePoint( 411.408630 , 362.184082 , 21.147415 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(380.026,378.730,13.270);]] )
   Camera:MotionSpline_AddSplinePoint( 411.408630 , 362.184082 , 21.147415 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(380.026,378.730,13.270);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
