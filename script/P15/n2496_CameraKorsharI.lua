-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 615.320923 , 339.386017 , 29.379593 , 5.099998 , [[Camera:ScriptSplineLookAtPosition(628.838,324.458,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 619.724731 , 341.715363 , 29.379593 , 3.499999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 623.159851 , 342.389496 , 29.379593 , 4.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 626.315796 , 342.589142 , 29.379593 , 4.999998 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
