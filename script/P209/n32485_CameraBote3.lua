-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 182.387115 , 525.206604 , 45.649574 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(163.103,569.835,20.150);]] )
   Camera:MotionSpline_AddSplinePoint( 182.387115 , 525.206604 , 45.649574 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(163.103,569.835,20.150);]] )
   Camera:MotionSpline_AddSplinePoint( 182.387115 , 525.206604 , 45.649574 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(163.103,569.835,20.150);]] )
   Camera:MotionSpline_AddSplinePoint( 182.387115 , 525.206604 , 45.649574 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(163.103,569.835,20.150);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
