-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 148.854919 , 667.436340 , 56.602715 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(259.220,448.049,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 148.854919 , 667.436340 , 56.602715 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(259.220,448.049,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 148.854919 , 667.436340 , 56.602715 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(259.220,448.049,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 148.854919 , 667.436340 , 56.602715 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(259.220,448.049,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
