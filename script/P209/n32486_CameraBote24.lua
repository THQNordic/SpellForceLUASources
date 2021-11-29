-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 303.310730 , 430.974030 , 18.304802 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.494,441.269,14.700);]] )
   Camera:MotionSpline_AddSplinePoint( 303.310730 , 430.974030 , 18.304802 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.494,441.269,14.700);]] )
   Camera:MotionSpline_AddSplinePoint( 303.310730 , 430.974030 , 18.304802 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.494,441.269,14.700);]] )
   Camera:MotionSpline_AddSplinePoint( 303.310730 , 430.974030 , 18.304802 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.494,441.269,14.700);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
