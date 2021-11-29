-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 327.367035 , 554.645630 , 70.190071 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(376.167,629.132,75.000);]] )
   Camera:MotionSpline_AddSplinePoint( 354.222229 , 577.386902 , 70.843704 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 373.429688 , 594.400391 , 73.493698 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.311035 , 598.498840 , 96.483116 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
