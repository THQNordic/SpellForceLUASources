-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 555.892700 , 398.486725 , 38.800560 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(588.559,399.962,40.270);]] )
   Camera:MotionSpline_AddSplinePoint( 561.961182 , 395.911255 , 38.711765 , 6.299996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.01);
Camera:ScriptSplineLookAtPosition(567.129,416.830,38.650);]] )
   Camera:MotionSpline_AddSplinePoint( 568.313049 , 395.035034 , 38.440563 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 580.708496 , 395.042633 , 38.440559 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
