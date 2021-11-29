-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 585.585144 , 387.994110 , 63.300594 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(2860);]] )
   Camera:MotionSpline_AddSplinePoint( 588.154419 , 386.648438 , 63.330585 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 589.536011 , 386.199615 , 63.340595 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 592.406250 , 385.778381 , 63.410595 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
